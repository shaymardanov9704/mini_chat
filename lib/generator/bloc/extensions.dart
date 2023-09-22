String textBloc(String snakeName, String pascalName) {
  return """
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '${snakeName}_event.dart';

part '${snakeName}_state.dart';

part '${snakeName}_bloc.freezed.dart';

class ${pascalName}Bloc
    extends Bloc<${pascalName}Event, ${pascalName}State> {
  ${pascalName}Bloc() : super(${pascalName}State.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<${pascalName}State> emit,
  ) async {}
}

""";
}

String textEvent(String snakeName, String pascalName) {
  return """
part of '${snakeName}_bloc.dart';

@freezed
abstract class ${pascalName}Event with _\$${pascalName}Event {
  factory ${pascalName}Event.init() = _init;
}
""";
}

String textState(String snakeName, String pascalName) {
  return """
part of '${snakeName}_bloc.dart';

@freezed
abstract class ${pascalName}State with _\$${pascalName}State {
  factory ${pascalName}State.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
""";
}

String textPage(String snakeName, String pascalName) {
  return """
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/${snakeName}_bloc.dart';

class ${pascalName}Page extends StatefulWidget {
  const ${pascalName}Page({Key? key}) : super(key: key);

  @override
  State<${pascalName}Page> createState() => _${pascalName}PageState();
}

class _${pascalName}PageState extends State<${pascalName}Page> {
  final bloc = ${pascalName}Bloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<${pascalName}Bloc, ${pascalName}State>(
        builder: (context, state) {
           return Scaffold(
            appBar: AppBar(title: const Text("$pascalName")),
          );
        },
      ),
    );
  }
}
""";
}
