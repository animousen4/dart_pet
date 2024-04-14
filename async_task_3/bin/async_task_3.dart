/// What will happen?
void main(List<String> arguments) async {
  print("a");

  Future(() => print("b")).then((value) => print(20));

  // then adds execution to the microtasks queue
  Future.microtask(() => print("s")).then((value) => print(30));

  // same here
  Future(() => print("c")).then((value) => print(40));

  // We are creating empty microtask here, and after that microtask was completed,
  // we are computing left microtasks, and then continue to execute synchronous code
  await someMethod();

  Future.sync(() => print("p")).then((value) => print(50));

  print("1");

  Future.microtask(() => print("t")).then((value) => print(60));

  print("2");

  await someOtherMethod();

  Future.microtask(() => print("v")).then((value) => print(70));

  print("h");
}

Future<void> someOtherMethod() async {
  print("z");
}

Future<void> someMethod() async {
  print("d");

  Future(() => print("e")).then((value) => print(10));
  Future.microtask(() => print("f"));
  Future.microtask(() => print("g"));

  Future.sync(() => print("j")).then((value) => print(80));

  Future(() => print("k"));

  print("m");
}

/// Solution:
/// 
/// Microtasks: 20 s 30(s) 40(b) 10(e) f g 80 50 t 60(t) v 70(v) 
/// Events: b c e k
/// 
/// a
/// d
/// j
/// m
/// s
/// 30
/// f
/// g
/// 80
/// p
/// 1
/// 2
/// z
/// 50
/// t
/// 60
/// h
/// v
/// 70
/// 
/// Correct
