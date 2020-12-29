class DataModel{
 // int id;
  String password;
  String email;
  String adress;
  DataModel({this.password,this.email});
  DataModel.from({this.email,this.password,this.adress});
  DataModel.fromjon(Map<String,dynamic> json):
     // id=json["id"],
        password=json["password"],
  email=json["email"],
  adress=json["adress"];
  Map<String,dynamic> toJson()=>{
  //  "id":id,
    "password":password,
    "email":email,
    "adress":adress

  };

}