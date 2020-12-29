import 'package:flutter/material.dart';
import 'package:flutter_app1/Prefs/http_service.dart';
import 'package:flutter_app1/model/post_model.dart';
class GetPage extends StatefulWidget {
  static final String id="get_page";
  @override
  _GetPageState createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  String data;
  @override
  void initState() {
    super.initState();
    // var post=Post(id:1,title:"PDP",body:"Online",userId:1);
    _apipostList();
  }

  void _apipostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
     print(response),
      _showResponse(response)
    });

  }
  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE+post.id.toString(), Network.paramCreate(post)).then((response) =>
    {
      print(response),
      _showResponse(response)
    });
  }
  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE, Network.paramUpdate(post)).then((response) =>
    {
      print(response),
      _showResponse(response)
    });
  }
  void _apiPostdelete(Post post){
    Network.DELETE(Network.API_DELETE, Network.paramsEmpty()).then((response) =>
    {
      print(response),
      _showResponse(response)
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
       children: [
        Text(data!=null?data:"No data"),
       ],
      ),
    );
  }
}
