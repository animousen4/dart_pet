/// What will happen here?
void main(List<String> arguments) {
  Future(() => print("1"));
  Future.microtask(() => print("k"));
  Future(() {
    print("2");
    asyncFunc("2");
  });
  Future(() => print("3"));

  print("main");
  asyncFunc("main");
  print("E");
}

Future<void> asyncFunc(String from) async {
  print("start  [from $from]");
  // await creates empty microtask, and works like THEN with code after await(then pushes microtask to queue).
  await (() async => print("middle [from $from]"))();
  print("end    [from $from]");
}

/// Solution:
/// Microtasks:
/// Events: 1 2([replaced]) 3 asyncFunc("main") asyncFync(2)
/// 
/// main
/// start [from main]
/// middle [from main]