class Home{
  String joined;
  String id;
  String tsp;
  String name;
  String phno;
  String address;
  String store;
  String sname;
  int balance;
  String mail;

  Home({this.joined, this.id, this.tsp, this.name, this.phno, this.address,
           this.store, this.sname, this.balance, this.mail});

 factory Home.fromJson(Map<String, dynamic> map){
   return Home(
     joined: map["joinedDate"],
     id: map["id"],
     tsp: map["TSp"], 
     name: map['name'],
     phno: map['phoneNo'],
     address: map['fullAddress'],
     store: map["clinicOrDrugStore"],
     sname: map["clinicOrDrugStoreName"],
     balance: map["gds_balance"],
     mail: map["email"],
   );
 }

}
