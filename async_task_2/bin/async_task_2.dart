
/// What is the difference in completing of [method1] and [method2] ?
/// Will be output the same or not?
void method1(){
  List<String> myArray = <String>['a','b','c'];
  print('before loop');
  myArray.forEach((String value) async {
    await delayedPrint(value);
  });  
  print('end of loop');
}
/// SOLUTION:
/// method1 output:
/// 
/// before loop
/// end of loop
/// delayedPrint: a
/// delayedPrint: b
/// delayedPrint: c

void method2() async {
  List<String> myArray = <String>['a','b','c'];
  print('before loop');
  for(int i=0; i<myArray.length; i++) {
    await delayedPrint(myArray[i]);
  }
  print('end of loop');
}

/// method2 output:
/// 
/// before loop
/// delayedPrint: a
/// delayedPrint: b
/// delayedPrint: c
/// end of loop


/// Correct.

Future<void> delayedPrint(String value) async {
  await Future.delayed(Duration(seconds: 1));
  print('delayedPrint: $value');
}




void main(List<String> arguments) {
  // print("method1:\n");
  // method1();
  print("\n\nmethod2:\n");
  method2();
}
