// extensions usecase:
// we have a class, which is not ours, and we want to add extra method to it,
// and we cannot extend it (like String)

void main(List<String> arguments) {
  print("started");

  String v = "10.324";
  String vRandom = "sdkpfjsdf";

  print("$v - ${v.toDouble()}");
  print("$vRandom - ${vRandom.toDouble()}");
}

extension DoubleConverter on String {
  double? toDouble() => double.tryParse(this);
}
