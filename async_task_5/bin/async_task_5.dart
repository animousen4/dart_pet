void main(List<String> arguments) async {
  Future(() {
    print("1");
  });

  Future.microtask(
    () => print("mc1"),
  );

  print("main s");

  await (
    // pushes before the below code, so await ~ to then
    someMethod()..then((value) => print("someMethod finished"))
    );

  print("main f");
}

Future<void> someOtherMethod() async {
  print("so1");
}

Future<void> someMethod() async {
  print("s1");

  await someOtherMethod();

  print("f1");
}
///
/// 
/// main s
/// s1
/// so1
/// mc1
/// f1
/// someMethod finished
/// main f
/// 1