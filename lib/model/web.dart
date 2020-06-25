class Getweb{
  int status;
  String msg;
  String agent;
  String code;
  String form;
  Getweb({this.status, this.msg, this.agent,
          this.code, this.form});

 factory Getweb.fromJson(Map<String, dynamic> map){
   return Getweb( 
     status: map['status'],
     msg: map['message'],
     agent: map['mtk_agent'],
     code: map['mtk_agent_code'],
     form: map['mtk_agent_form'],
   );
 }

}