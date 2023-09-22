import 'dart:io';
import 'string_variable_extensions.dart';
import 'extensions.dart';

class BlocHelper {
  final String name;
  final bool page;

  const BlocHelper({required this.name, this.page = false});

  Future<void> generate() async {
    final snakeName = name.toSnakeCase();
    final pascalName = name.toPascalCase();
    await _clearCache(snakeName, page);
    await _saveContent(snakeName, pascalName, page);
    print("Success");
  }

  Future<void> _clearCache(String snakeName, bool page) async {
    final dir = Directory("${Directory.current.path}/lib/generator/bloc/bloc");
    final dirWithPage =
        Directory("${Directory.current.path}/lib/generator/bloc/$snakeName");
    final dirWithPageBloc = Directory(
        "${Directory.current.path}/lib/generator/bloc/$snakeName/bloc");
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
    if (await dirWithPage.exists()) {
      await dirWithPage.delete(recursive: true);
    }
    if (page) {
      await dirWithPage.create();
      await dirWithPageBloc.create();
    } else {
      await dir.create();
    }
  }

  Future<void> _saveContent(
    String snakeName,
    String pascalName,
    bool page,
  ) async {
    final dir = Directory(
        "${Directory.current.path}/lib/generator/bloc${page ? "/$snakeName" : ""}/bloc");
    await File("${dir.path}/${snakeName}_bloc.dart").writeAsString(
      textBloc(snakeName, pascalName),
    );
    await File("${dir.path}/${snakeName}_event.dart").writeAsString(
      textEvent(snakeName, pascalName),
    );
    await File("${dir.path}/${snakeName}_state.dart").writeAsString(
      textState(snakeName, pascalName),
    );
    if (page) {
      await File(
        "${Directory.current.path}/lib/generator/bloc/$snakeName/${snakeName}_page.dart",
      ).writeAsString(textPage(
        snakeName,
        pascalName,
      ));
    }
  }
}
