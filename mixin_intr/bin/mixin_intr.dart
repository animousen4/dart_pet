import 'package:mixin_intr/mixin_intr.dart';

void main(List<String> arguments) {
  print("started\n");

  Bee()
    ..fly()
    ..fly();
  Airplane()
    ..fly()
    ..repair();
  
}
