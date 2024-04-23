import 'dart:isolate';

void main(List<String> arguments) {
  print("Isolates task\n--------------------");

  Isolate.run<int>(() async {
    int a = 2;
    print("running heavy task:");

    //await Future.delayed(Duration(milliseconds: 200));
    for (int i = 0; i < 500000000; i++) {
      a += 2;
    }

    return a;
  }).then((value) => print("result: $value"));
}
