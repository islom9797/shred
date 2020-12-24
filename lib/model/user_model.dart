class User{
  String id;
  String name;
  String email;
  String password;
  String phonenumber;
  User({this.id,this.email,this.password});
  User.from({this.email,this.password});
  User.fourelements({this.name,this.email,this.password,this.phonenumber});

  User.fromJson(Map <String,dynamic>json)
  :id=json['id'],
  email=json['email'],
  password=json['password'],
  phonenumber=json['phonenumber'],
        name=json['name'];

  Map <String,dynamic>toJson()=>{
        "id":id,
        "email":email,
        "password":password,
        "phonenumber":phonenumber,
        "name":name
      };
}