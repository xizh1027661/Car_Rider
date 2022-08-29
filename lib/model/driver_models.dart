const String tableDriver='tbl_drivers';
const String tableDriverId='id';
const String tableDriverName='name';
const String tableDriverSkill='skill';
const String tableDriverImageUrl='url';
const String tableDriverRating='rating';
const String tableDriverAbility='ability';
const String tableDriverSalary='salary';


class DriverModel{
  int id;
  String driverImageUrl;
  String driverName;
  String driverSkill;
  String driverRating;
  double driverSalary;
  String driverAbility;

  DriverModel({required this.id,required this.driverImageUrl,required this.driverName,required this.driverSkill,required this.driverRating,required this.driverSalary,required this.driverAbility});

  Map<String,dynamic> toMap(){

    var map=<String,dynamic>{
      tableDriverImageUrl:driverImageUrl,
      tableDriverName:driverName,
      tableDriverSkill:driverSkill,
      tableDriverRating:driverRating,
      tableDriverSalary:driverSalary.toString(),
      tableDriverAbility:driverAbility=="Available"?1:0
    };
    if(id!=null){
      map[tableDriverId]=id;
    }
    return map;
  }

  factory DriverModel.fromMap(Map<String,dynamic> map)=>DriverModel(
      id: map[tableDriverId],
      driverImageUrl: map[tableDriverImageUrl],
      driverName: map[tableDriverName],
      driverSkill: map[tableDriverSkill],
      driverRating: map[tableDriverRating],
      driverSalary: double.parse(map[tableDriverSalary]),
      driverAbility: map[tableDriverAbility]==1?"Available":"Not Available");

  @override
  String toString() {
    return 'DriverModel{id: $id, driverImageUrl: $driverImageUrl, driverName: $driverName, driverSkill: $driverSkill, driverRating: $driverRating, driverSalary: $driverSalary, driverAbility: $driverAbility}';
  }
}