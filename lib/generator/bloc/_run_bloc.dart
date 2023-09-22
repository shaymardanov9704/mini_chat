import 'bloc_helper.dart';

void main() async {
  await helper.generate();
}

const helper = BlocHelper(name: "auth", page: true);
