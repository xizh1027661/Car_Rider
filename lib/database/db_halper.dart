
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/car_models.dart';
import '../model/driver_models.dart';
import '../model/fare_model.dart';
import '../model/user_booking_model.dart';


class DBHalper{
  static const String createTableCar='''create table $tableCar(
  $tableCarId integer primary key,
  $tableCarName text,
  $tableCarPlace text,
  $tableCarPicUrl text,
  $tableCarPrice text,
  $tableCarAbility integer
  )''';
  static const String createTableDriver='''create table $tableDriver(
  $tableDriverId integer primary key,
  $tableDriverName text,
  $tableDriverSkill text,
  $tableDriverImageUrl text,
  $tableDriverRating text,
  $tableDriverSalary text,
  $tableDriverAbility integer
  )''';
  static const String createTableFare='''create table $tableFareByDistence(
  $tableFareByDistenceId integer primary key,
  $tableFareByDistenceStartPlace text,
  $tableFareByDistenceEndPlace text,
  $tableFareByDistenceCarId integer,
  $tableFareByDistenceDriverId integer,
  $tableFareByDistencePrice text,
  $tableFareByDistenceAbility integer
  )''';
  static const String createTablePlaceOrder='''create table $tablePlaceOrder(
      $tablePlaceOrderId text primary key,
      $tablePlaceOrderUserName text,
      $tablePlaceOrderUserAddress text,
      $tablePlaceOrderUserNumber text,
      $tablePlaceOrderDestination text,
      $tablePlaceOrderDate text,
      $tablePlaceOrderCarId integer,
      $tablePlaceOrderDriver text,
      $tablePlaceOrderfare text
  )''';




  static Future<Database> open() async{

    final rootPath =await getDatabasesPath();
    final dbPath =join(rootPath,'rent_car.db');

    return openDatabase(dbPath,version: 3,onCreate: (db,version){
      db.execute(createTableCar);
      db.execute(createTableDriver);
      db.execute(createTableFare);
    },onUpgrade: (db,oldVersion,newVersion){
      db.execute(createTablePlaceOrder);
    });
  }
  //Create PlaceOrder
  static Future<int> insertPlaceOrder(PlaceOrder placeOrder) async{
    final db = await open();
    return db.insert(tablePlaceOrder, placeOrder.toMap());
  }
  static Future<List<PlaceOrder>> getAllPlaceOrder() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tablePlaceOrder, orderBy: '$tablePlaceOrderId asc');
    return List.generate(mapList.length, (index) =>
        PlaceOrder.fromMap(mapList[index]));
  }

    //Drivers Oparetions
  static Future<int> insertDriver(DriverModel driverModel) async{
    final db = await open();
    return db.insert(tableDriver, driverModel.toMap());
  }
  static Future<List<DriverModel>> getAllDriver() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableDriver, orderBy: '$tableDriverId asc');
    return List.generate(mapList.length, (index) =>
        DriverModel.fromMap(mapList[index]));
  }


  static Future<int> deleteDriver(int id) async {
    final db = await open();
    return db.delete(tableDriver, where: '$tableDriverId = ?', whereArgs: [id]);
  }
  static Future<DriverModel> getDriverById(int id) async {
    final db = await open();
    final mapList = await db.query(tableDriver, where: '$tableDriverId = ?', whereArgs: [id]);
    return DriverModel.fromMap(mapList.first);
  }
  static Future<List<DriverModel>> getAllDriverOnline()async{

    final db =await open();
    final  mapList= await db.query(tableDriver,where: '$tableDriverAbility=?',whereArgs: [1],orderBy:'$tableDriverId asc' );

    return List.generate(mapList.length, (index) =>
        DriverModel.fromMap(mapList[index]));
  }


//Car oparetions

  static Future<int> insertCar(CarModel carModel) async{
    final db = await open();
    return db.insert(tableCar, carModel.toMap());
  }
  static Future<List<CarModel>> getAllCarDetails() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableCar, orderBy: '$tableCarId asc');
    return List.generate(mapList.length, (index) =>
        CarModel.fromMap(mapList[index]));
  }
  static Future getAllCarShow() async {
    final db = await open();
    var mapList =await db.rawQuery("select $tableCarName from $tableCar where $tableCarAbility=1");
    print(mapList);
    return mapList;
  }


  static Future<int> deleteCar(int id) async {
    final db = await open();
    return db.delete(tableCar, where: '$tableCarId = ?', whereArgs: [id]);
  }
  static Future<CarModel> getCarById(int id) async {
    final db = await open();
    final mapList = await db.query(tableCar, where: '$tableCarId = ?', whereArgs: [id]);
    return CarModel.fromMap(mapList.first);
  }
  static Future<List<CarModel>> getAllCarOnline()async{

    final db =await open();
    final  mapList= await db.query(tableCar,where: '$tableCarAbility=?',whereArgs: [1],orderBy:'$tableCarId asc' );

    return List.generate(mapList.length, (index) =>
        CarModel.fromMap(mapList[index]));
  }
  static Future<int> updateCarOnline(int id, int value) async {
    final db = await open();
    return db.update(
        tableCar,
        {tableCarAbility : value},
        where: '$tableCarId = ?', whereArgs: [id]);
  }


  ///Fare database

  static Future<int> insertFare(FareByDistence fareByDistence) async {
    final db = await open();
    return db.insert(tableFareByDistence, fareByDistence.toMap());
  }
  static Future<List<FareByDistence>> getAllFare() async {
    final db = await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableFareByDistence, orderBy: '$tableFareByDistenceId asc');
    return List.generate(mapList.length, (index) =>
        FareByDistence.fromMap(mapList[index]));
  }
  static Future<List<FareByDistence>> getAllOnlineFare()async{
    final db =await open();
    final List<Map<String, dynamic>> mapList = await db.query(tableFareByDistence,
        where: '$tableFareByDistenceAbility=?',whereArgs: [1], orderBy: '$tableFareByDistenceId asc');
    return List.generate(mapList.length, (index) =>
        FareByDistence.fromMap(mapList[index]));
  }
  static Future<FareByDistence> getFareById(int id) async {
    final db = await open();
    final mapList = await db.query(tableFareByDistence, where: '$tableFareByDistenceId = ?', whereArgs: [id]);
    return FareByDistence.fromMap(mapList.first);
  }
  static Future<int> deletefare(int id) async {
    final db = await open();
    return db.delete(tableFareByDistence, where: '$tableFareByDistenceId = ?', whereArgs: [id]);
  }

}