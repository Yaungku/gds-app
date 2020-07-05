class History{
  String name;
  String phno;
  int cost;
  // int type;
  String tranid;
  String agent;
  // Trantime time;
  History({this.name, this.phno, this.cost,
           this.tranid, this.agent});

 factory History.fromJson(Map<String, dynamic> map){
   return History( 
     name: map['name'],
     phno: map['phoneNo'],
     cost: map['cost'],
    //  type: map['question_type'],
     tranid: map['trans_id'],
     agent: map['user_agent'],
    //  time: ContactUser.fromJson(map['user'])
   );
 }

}
