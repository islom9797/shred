
import 'package:flutter_app1/Hive_Homework/models/user_model.dart';
import 'package:hive/hive.dart';

class HiveHomeDB{
  var box=Hive.box("pdp");
  void storeUser(DataModel model) async{
    box.put("model", model.toJson());
  }
  DataModel loadUser(){
    var model=new DataModel.fromjon(box.get("model"));
    return model;
  }
  void removeUser(){
    box.delete("model");
  }

}