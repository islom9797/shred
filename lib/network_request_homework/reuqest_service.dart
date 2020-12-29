import 'dart:convert';

import 'package:flutter_app1/network_request_homework/users_modul.dart';
import 'package:http/http.dart';

class Request_service{
  static String BASE="dummy.restapiexample.com";
  static Map<String,String> headers={'Content-Type':"application/json;charset=UTF-8"};

  //API
  static String API_LIST="/api/v1/employees";
  static String API_LIST2="/api/v1/employees/1";
  static String API_CREATE="api/v1/create";
  static String API_UPDATE="api/v1/update/21";
  static String API_DELETE="api/v1/delete/2";
  //http requests
static Future<String> GET(String api,Map<String,String> params) async{
  var uri=Uri.http(BASE, api,params);
  var response=await get(uri,headers: headers);
  if(response.statusCode==200){
    return response.body;
  }
  return null;

}
  static Future<String> CREATE(String api,Map<String,String> params) async{
    var uri=Uri.http(BASE, api);
    var response=await post(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }
    return null;

  }
  static Future<String> UPDATE(String api,Map<String,String> params) async{
    var uri=Uri.http(BASE, api);
    var response=await put(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }
    return null;

  }
  static Future<String> DELETE(String api,Map<String,String> params) async{
    var uri=Uri.http(BASE, api,params);
    var response=await delete(uri,headers: headers,);
    if(response.statusCode==200){
      return response.body;
    }
    return null;

  }
  //*Parameters
static Map<String,String> paramEmpty(){
  Map<String,String> params=new Map();
  return params;
}

  static Map<String,String> paramsCreate(Dummy_model model){
    Map<String,String> params=new Map();
    return params;
  }

  static Map<String,String> paramUpdate(Dummy_model model){
    Map<String,String> params=new Map();
    params.addAll({
      "id":model.id.toString(),
      "employee_name":model.employee_name,
      "employee_salary":model.employee_salary,
      "employee_age":model.employee_age.toString(),
      "profile_image":model.profile_image,
    });
    return params;
  }
}