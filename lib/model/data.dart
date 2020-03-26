class Data {
  String name, /// Prenom
      familyName, /// Nom
      motherName, /// NomMere
      productionDate, /// PRODDATE
      acquisitionDate, /// dateaquisition
      color, /// CouleurDesc
      brand, /// MarqueDesc
      type, /// TypeDesc
      utility, /// UtilisDesc
      phoneNumber, /// TelProp
      sijil, /// NoRegProp
      birthDay, /// AgeProp
      birthPlace; /// BirthPlace
  int id;

  Data({this.name, this.familyName, this.motherName, this.productionDate,
      this.acquisitionDate, this.color, this.brand, this.type, this.utility,
      this.phoneNumber, this.sijil, this.birthDay, this.birthPlace});

  Data.map(dynamic obj) {
    this.name = obj['name'];
    this.familyName = obj['familyName'];
    this.motherName = obj['motherName'];
    this.productionDate = obj['productionDate'];
    this.acquisitionDate = obj['acquisitionDate'];
    this.color = obj['color'];
    this.brand = obj['brand'];
    this.type = obj['type'];
    this.utility = obj['utility'];
    this.phoneNumber = obj['phoneNumber'];
    this.sijil = obj['sijil'];
    this.birthDay = obj['birthDay'];
    this.birthPlace = obj['birthPlace'];
    this.id = obj['id'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["familyName"] = familyName;
    map["motherName"] = motherName;
    map["productionDate"] = productionDate;
    map["acquisitionDate"] = acquisitionDate;
    map["color"] = color;
    map["brand"] = brand;
    map["type"] = type;
    map["utility"] = utility;
    map["phoneNumber"] = phoneNumber;
    map["sijil"] = sijil;
    map["birthDay"] = birthDay;
    map["birthPlace"] = birthPlace;
    return map;
  }

  Data.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.familyName = map['familyName'];
    this.motherName = map['motherName'];
    this.productionDate = map['productionDate'];
    this.acquisitionDate = map['acquisitionDate'];
    this.color = map['color'];
    this.brand = map['brand'];
    this.type = map['type'];
    this.utility = map['utility'];
    this.phoneNumber = map['phoneNumber'];
    this.sijil = map['sijil'];
    this.birthDay = map['birthDay'];
    this.birthPlace = map['birthPlace'];
  }
}