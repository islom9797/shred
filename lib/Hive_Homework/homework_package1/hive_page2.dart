import 'package:flutter/material.dart';
import 'package:flutter_app1/Hive_Homework/homework_package1//hive_page.dart';
import 'package:hive/hive.dart';
class HivePage2 extends StatefulWidget {
  static final String id="hive_page2";
  @override
  _HivePage2State createState() => _HivePage2State();
}

class _HivePage2State extends State<HivePage2> {
  final usernamecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final phonecontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  void doReg(){
    String username=usernamecontroller.text.toString().trim();
    String email =emailcontroller.text.toString().trim();
    String phone=phonecontroller.text.toString().trim();
    String password=passwordcontroller.text.toString().trim();
    var box=Hive.box('pdp');
    box.put("username", username);
    box.put("email", email);
    box.put("phone", phone);
    box.put("password", password);
    var user=box.get('username');
    var user1=box.get('email');
    var user2=box.get('phone');
    var user3=box.get('password');
    print(user);
    print(user1);
    print(user2);
    print(user3);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent.withOpacity(.2),
      body: Column(
        children: [
          SizedBox(height: 150,),
          Text("Create",style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 30,fontWeight: FontWeight.bold),),
          Text("Account",style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 30,fontWeight: FontWeight.bold),),

          SizedBox(height: 50,),
          //username
          Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: usernamecontroller,
              style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Colors.grey,),
                  hintText:" User Name",
                  hintStyle: TextStyle(color: Colors.grey,),
                    hoverColor: Colors.white,
              ),

            ),
          ),
          SizedBox(height: 5,),
          //email
          Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: emailcontroller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  icon: Icon(Icons.email,color: Colors.grey,),
                  hintText:" Email",
                  hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
          ),
          SizedBox(height: 5,),
          //phone
          Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: phonecontroller,
              style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  icon: Icon(Icons.phone,color: Colors.grey,),
                  hintText:" Phone Number",
                  hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              controller: passwordcontroller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline,color: Colors.grey,),
                  hintText:" Password",
                  hintStyle: TextStyle(color: Colors.grey)

              ),

            ),
          ),
          SizedBox(height: 30,),
          //Button
          Container(
            height: 65,
            width: 65,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,

            ),


            child: FlatButton(
              onPressed: doReg,
              child: Icon(Icons.arrow_right_alt,color: Colors.white,),
            ),
          ),
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Already have an account?",style: TextStyle(color: Colors.grey[500],fontSize: 16,fontWeight: FontWeight.w400),),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, HiveHomework.id);
                },
                child: Text("SIGN IN",style: TextStyle(color: Colors.blue[500],fontSize: 16,fontWeight: FontWeight.w400),),
              )
            ],
          )


        ],
      ),
    );
  }
}
