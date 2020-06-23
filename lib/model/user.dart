class ResponseData{
 int code;
 String message;
 String apiVersion;
 User user;

 ResponseData({this.code, this.message, this.apiVersion,
           this.user});

 factory ResponseData.fromJson(Map<String, dynamic> map){
   return ResponseData( 
     code: map['code'],
     message: map['message'],
     apiVersion: map['apiVersion'],
     user: User.fromJsonMap(map['loginUser'])
   );
 }

}
class User{
  int id;
  int tmdUserId;
  int buyerId;
  String token;
  String name;
  String email;
  String phno;
  String storetype;
  String storename;
  String lastuse;
  String lastorder;
  String note;
  // Address address;
  // User(this.mail, this.password, this.id, this.token);
  
  User.fromJsonMap(Map<String, dynamic> map):
  id = map ['id'],
  tmdUserId = map['tmdUserId'],
  buyerId = map['buyerUserId'],
  token = map['accessToken'],
  name = map['name'],
  email = map['email'],
  phno = map['phoneNo'],
  storetype = map['clinicOrDrugStore'],
  storename = map['clinicOrDrugStoreName'],
  lastuse = map['lastTimeUseApp'],
  lastorder = map['lastTimeOrder'],
  note = map['tmdNote'];
  // address = Address.fromJsonMap(map["address"]);

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
    data['tmdUserId'] = tmdUserId;
    data['buyerUserId'] = id;
    data['accessToken'] = token;
    data['name'] = name;
    data['email'] = email;
    data['phoneNo'] = phno;
    data['clinicOrDrugStore'] = storetype;
    data['clinicOrDrugStoreName'] = storename; 
    data['lastTimeUseApp'] = lastuse;
    data['lastTimeOrder'] = lastorder;
    data['tmdNote'] = note;
    return data;
  }
}

// class Address{
//   int addressid;
//   String address;
//   int longitude;
//   int latitude;
//   String name;

//   Address.fromJsonMap(Map<String, dynamic> map):
//   addressid = map ['addressId'],
//   address = map['fullAddress'],
//   longitude = map['longitude'],
//   latitude = map['latitude'],
//   name = map['buildingName'];
// }