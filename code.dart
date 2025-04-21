import 'dart:io';



void main() {

   CarRentalSystem system = CarRentalSystem();
  system.addCar(Sedan(0,"Toyota", "Camry", "Black" ,2020,500009));
  system.addCar(Jeep(1,"Ford", "Explorer", "Blue" ,2022,120800));
  system.addCar(Sedan(2,"Honda", "Accord", "Burgundy" ,2019,800000));
  system.addCar(Hatchback(3, "Audi", "A3", "Red", 2018, 6000450));


  CustomerInfo(0, "Aser", "013456446", "06460164361", "Giza", 2,"Rented",system);
  CustomerInfo(1, "Hoda", "013456446", "06460164361", "Cairo", 0,"Returned",system);
  CustomerInfo(2, "Safi", "013456446", "06460164361", "Alex", 1,"Returned",system);

  


   system.showAvailableCars();

   system.rentCar(); 
  
   system.returnCar();

  CustomerInfo.ShowCustomers();
 
}
 
abstract class Car {
  int id;
  String brand;
  String model;
  String color;
  int year;
  double price;
  bool _isAvailable = true; 
  bool _isRented = false;
  bool _isReturned = false;

  Car(this.id, this.brand, this.model, this.color,this.year, this.price);
  
  bool get isAvailable => _isAvailable;

  bool get isRented => _isRented;

  bool get isReturned => _isReturned;

  

  void displayInfo(); 
}


class Sedan extends Car {
  Sedan(int id, String brand, String model, String color, int year, double price) : super(id ,brand, model, color, year, price);

  @override
  void displayInfo() {
    print(isAvailable? "Sedan: $brand $model $color ($year) Price = $price  Id = $id" : null);
  }
}


class Jeep extends Car {
  Jeep(int id, String brand, String model, String color,int year, double price) : super(id ,brand, model, color, year, price);

  @override
  void displayInfo() {
    print(isAvailable? "Jeep: $brand $model $color ($year) Price = $price  Id = $id" : null);
  }
}

class Hatchback extends Car {
  Hatchback(int id, String brand, String model, String color,int year, double price) : super(id ,brand, model, color, year, price);

  @override
  void displayInfo() {
    print(isAvailable? "Hatchback: $brand $model $color ($year) Price = $price  Id = $id" : null);
  }
}

class CarRentalSystem {
  List<Car> _carInventory = [];

  void addCar(Car car) {
    _carInventory.add(car);
  }

  void showAvailableCars() {
    print("\nAvailable Cars:");
    for (int i = 0; i < _carInventory.length; i++) {
      if (_carInventory[i].isAvailable) {
        stdout.write('${i+1}- ');
        _carInventory[i].displayInfo();
      }
    }
  print("/////////////////////////////////////////\n");

  }

  void rentCar() {
    print("Rented Cars: ");
    for(int i = 0; i < _carInventory.length; i++) {
      if (_carInventory[i].isRented) {
       print("${_carInventory[i].brand},${_carInventory[i].model},${_carInventory[i].color} (${_carInventory[i].year}), Price= ${_carInventory[i].price}, Id= ${_carInventory[i].id}");
      } 
      }
  print("/////////////////////////////////////////\n");

    } 
      

  void returnCar() {
    print("Returned Cars: ");
    for(int i = 0; i < _carInventory.length; i++) {
      if (_carInventory[i].isReturned) {
       print("${_carInventory[i].brand},${_carInventory[i].model},${_carInventory[i].color} (${_carInventory[i].year}), Price= ${_carInventory[i].price}, Id= ${_carInventory[i].id}");
      } 
      }
  print("/////////////////////////////////////////\n");

  }

}

class CustomerInfo{
  int Id;
  String Name;
  String Phone;
  String National_Id;
  String Address;
  int RentedCarId;
  String CarStatus;

static List<CustomerInfo> customers = [];

  CustomerInfo(this.Id, this.Name, this.Phone, this.National_Id, this.Address, this.RentedCarId, this.CarStatus,CarRentalSystem car){
      customers.add(this);
      if(this.CarStatus == "Rented")
            car._carInventory[this.RentedCarId]._isRented = true;
      else
            car._carInventory[this.RentedCarId]._isReturned = true;
          
  }
  
  static void ShowCustomers(){
    print("ID\tNAME\tPHONE\tNATIONAL ID\tADDRESS\tRENTED CAR\tCAR STATUS");
    for(int i = 0; i < customers.length; i++){
        print("${customers[i].Id}\t${customers[i].Name}\t${customers[i].Phone}\t${customers[i].National_Id}\t${customers[i].Address}\t${customers[i].RentedCarId}\t${customers[i].CarStatus}");
    }
  print("/////////////////////////////////////////\n");

  }
}
