import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Hive_Homework/homework_package1//hive_page2.dart';
import 'package:hive/hive.dart';
class HiveHomework extends StatefulWidget {
  static final String id="hive_homework";
  @override
  _HiveHomeworkState createState() => _HiveHomeworkState();
}

class _HiveHomeworkState extends State<HiveHomework> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  void _doLogin(){
    String emailname=emailController.text.toString().trim();
    String password=passwordController.text.toString().trim();
    var box=Hive.box('pdp');
    box.put('emailname', emailname);
    box.put('password', password);

    String email=box.get('emailname');
    String pw=box.get('password');
    print(email);
    print(pw);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent.withOpacity(.2),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 130,),
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
               image:DecorationImage(
                 image: AssetImage("assets/images/q.png")
               )

              ),
            ),
          ),
          SizedBox(height: 20,),
          Text("Welcome Back!",style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text("Sign in to continue",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
          SizedBox(height: 50,),
          Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: emailController,
              decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Colors.grey,),
                  hintText:" User Name",
                  hintStyle: TextStyle(color: Colors.grey)

              ),

            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline,color: Colors.grey,),
                  hintText:" Password",
                  hintStyle: TextStyle(color: Colors.grey)
              ),

            ),
          ),
          SizedBox(height: 15,),
          Text("Forgot Password?",style: TextStyle(color: Colors.grey[500],fontSize: 12,fontWeight: FontWeight.w400),),
         SizedBox(height: 50,),
          Container(
            height: 65,
              width: 65,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,

            ),
            child: FlatButton(
              onPressed: _doLogin,
              child: Icon(Icons.arrow_right_alt,color: Colors.white,size: 40,),
            ),
          ),
          SizedBox(height: 50,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             Text("Don't have an account?",style: TextStyle(color: Colors.grey[500],fontSize: 12,fontWeight: FontWeight.w400),),
             GestureDetector(
               onTap: (){
                 Navigator.pushNamed(context, HivePage2.id);
               },
               child: Text("SIGN UP",style: TextStyle(color: Colors.blue[500],fontSize: 12,fontWeight: FontWeight.w400),),
             )
           ],
         )
        ],



      ),
    );
  }
}
