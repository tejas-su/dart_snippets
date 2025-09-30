// A base class
class Animal {
  void eat() => print("Eating...");
}

// Another base class
class Vehicle {
  void drive() => print("Driving...");
}

// A mixin constrained to only work on Animal (or its subclasses)
mixin Walker on Animal {
  void walk() {
    print("Walking...");
    eat(); // safe because only Animals have `eat()`
  }
}

// Another mixin constrained to only work on Vehicle
mixin Horn on Vehicle {
  void honk() {
    print("Honking horn!");
    drive(); // safe because only Vehicles have `drive()`
  }
}

// Class extending Animal and using Walker
class Dog extends Animal with Walker {
  void bark() => print("Woof!");
}

// Class extending Vehicle and using Horn
class Car extends Vehicle with Horn {
  void start() => print("Car started!");
}

// Define a mixin
mixin Logger {
  void log(String message) {
    final now = DateTime.now();
    print("[$now] $message");
  }
}

// Another mixin
mixin Printer {
  void printData(String data) {
    print("Printing: $data");
  }
}

// A base class
class Device {
  final String name;
  Device(this.name);
}

// Class using the mixins
class Phone extends Device with Logger, Printer {
  Phone(String name) : super(name);

  void call(String number) {
    log("Calling $number from $name");
  }
}

void main() {
  var dog = Dog();
  dog.walk(); // from Walker mixin
  dog.bark(); // from Dog

  var car = Car();
  car.honk(); // from Horn mixin
  car.start(); // from Car

  var myPhone = Phone("Nothing Phone 3a Pro");

  myPhone.call("9876543210");
  myPhone.printData("Hello World");
}
