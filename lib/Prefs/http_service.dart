import 'dart:convert';

import 'package:flutter_app1/model/post_model.dart';
import 'package:http/http.dart';
class Network{
 static String BASE="dummy.restapiexample.com";
 static Map<String,String> headers={'Content-Type':"application/json;charset=UTF-8"};
 //http Apis
static String API_LIST="/api/v1/employees";
static String API_LIST2="/api/v1/employees/1";
static String API_CREATE="api/v1/create";
static String API_UPDATE="api/v1/update/21";
static String API_DELETE="api/v1/delete/2";
//http request
static Future<String> GET(String api,Map<String,String> params) async{
  var uri=Uri.http(BASE, api,params);
  var response=await get(uri,headers: headers);
  if(response.statusCode==200){
    return response.body;
  }
  return null;
}

  static Future<String> POST(String api,Map<String,String> params) async{
    var uri=Uri.http(BASE, api);
    var response=await post(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200||response.statusCode==201){
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api,Map<String,String> params) async{
    var uri=Uri.http(BASE, api,params);
    var response=await put(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

  static Future<String> DELETE(String api,Map<String,String> params) async{
    var uri=Uri.http(BASE, api,params);
    var response=await delete(uri,headers: headers);
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }
//http paramets
static Map<String,String> paramsEmpty(){
  Map<String,String> params=new Map();
  return params;
}
static  Map<String,String> paramCreate(Post post){
  Map<String,String> params=new Map();
  params.addAll({
    'title':post.title,
    "body":post.body,
    "userId":post.userId.toString(),

  });
}
static Map<String,String> paramUpdate(Post post){
  Map<String,String> params=new Map();
  params.addAll({
    'id':post.id.toString(),
    "title":post.title,
    "body":post.title,
    "userId":post.userId.toString(),
  });
}
}