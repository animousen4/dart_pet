mixin Flyable {
  void fly() {
    print("Flying");
  }
}

mixin Flyable2 {
  void fly() {
    print("Flying 2");
  }
}
mixin Mechanism {
  void repair() {
    print("Repairing");
  }
}

// We reuse the same code for 2 classes
// BUT: if two mixins have the same method, the latest selected will be used
class Bee with Flyable, Flyable2 {}

class Airplane with Flyable, Mechanism {}
