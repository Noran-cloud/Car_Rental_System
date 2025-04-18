import 'dart:io';
import 'dart:math';


void main() {
  CarRentalSystem system = CarRentalSystem();

  
  system.addCar(Sedan("Toyota", "Camry", "Black" ,2020));
  system.addCar(Jeep("Ford", "Explorer", "Blue" ,2022));
  system.addCar(Sedan("Honda", "Accord", "burgundy" ,2019));

  system.showAvailableCars();

  system.rentCar(0); 
  system.showAvailableCars();
  
  system.returnCar(0);
  system.showAvailableCars();
}

abstract class Car {
  String brand;
  String model;
  String color;
  int year;
  bool _isAvailable = true; 

  Car(this.brand, this.model, this.color,this.year);

  bool get isAvailable => _isAvailable;

  void rent() {
    _isAvailable = false;
  }

  void returnCar() {
    _isAvailable = true;
  }

  void displayInfo(); 
}


class Sedan extends Car {
  Sedan(String brand, String model, String color, int year) : super(brand, model, color,year);

  @override
  void displayInfo() {
    print("Sedan: $brand $model $color ($year) - ${isAvailable ? "Available" : "Rented"}");
  }
}


class Jeep extends Car {
  Jeep(String brand, String model, String color,int year) : super(brand, model, color, year);

  @override
  void displayInfo() {
    print("Jeep: $brand $model $color ($year) - ${isAvailable ? "Available" : "Rented"}");
  }
}


class CarRentalSystem {
  List<Car> _carInventory = [];

  void addCar(Car car) {
    _carInventory.add(car);
    print("${car.brand} ${car.model} added to inventory.");
  }

  void showAvailableCars() {
    print("\nAvailable Cars:");
    for (int i = 0; i < _carInventory.length; i++) {
      if (_carInventory[i].isAvailable) {
        print("[$i] ");
        _carInventory[i].displayInfo();
      }
    }
  }

  void rentCar(int index) {
    if (index >= 0 && index < _carInventory.length) {
      if (_carInventory[index].isAvailable) {
        _carInventory[index].rent();
        print("You rented: ${_carInventory[index].brand} ${_carInventory[index].model}");
      } else {
        print("Car is already rented.");
      }
    } else {
      print("Invalid car index.");
    }
  }

  void returnCar(int index) {
    if (index >= 0 && index < _carInventory.length) {
      if (!_carInventory[index].isAvailable) {
        _carInventory[index].returnCar();
        print("You returned: ${_carInventory[index].brand} ${_carInventory[index].model}");
      } else {
        print("Car is already available.");
      }
    } else {
      print("Invalid car index.");
    }
  }
}

