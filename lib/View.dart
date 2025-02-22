

void main(){
  Cat cat = Cat("Nope", "RED");
  print(cat.name);
}


abstract class Animal {
  void walk();
  void run();
  void eat();
}

class Cat extends Animal{

  // public variables;
  String? name;
  String? color;

  // private one.
  String? _privateData;
  String? get privateData => _privateData;


  void setPrivateData(String a){
    _privateData = a;
  }

  Cat(this.name, this.color);


  @override
  void walk(){
    print("Cat walk");
  }
  @override
  void run(){
    print("Cat walk");
  }
  @override
  void eat(){
    print("Cat walk");
  }
}