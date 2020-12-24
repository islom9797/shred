import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Prefs/Prefs.dart';
import 'package:flutter_app1/model/user_model.dart';
import 'package:flutter_app1/packages/secondpage.dart';
import 'package:flutter_icons/flutter_icons.dart';
class HomePage extends StatefulWidget {
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myName="";
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  void _doLogin(){
String email=emailController.text.toString().trim();
String password=passwordController.text.toString().trim();
User user=User.from(email:email,password:password);
Prefs.storeUser(user);
Prefs.loadUser().then((value) => {print(user.email)});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:50,),
          Container(

            height: 200,
           width: double.infinity,
           child: Image(
             image: AssetImage("assets/images/q.png"),
           ),

          ),
          Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          SizedBox(height: 10,),
          Text("Log in to your account of Q aLLiure",style:TextStyle(color: Colors.grey[500]),),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            height: 50,
            padding: EdgeInsets.only(right: 15,left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[200],
                          ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.person,color: Colors.grey,)
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            height: 50,
            padding: EdgeInsets.only(right: 15,left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey[200],
            ),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.lock_outlined,color: Colors.grey,)
              ),
            ),
          ),
          SizedBox(height: 20,),
         Container(
           padding: EdgeInsets.only(right: 30),
           height: 20,
           width: double.infinity,
           child:  Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [Text("Forgot Password?",style: TextStyle(fontWeight: FontWeight.normal,),)],
           ),
         ),
          SizedBox(height: 20,),
          Container(
            height: 50,
            width: 230,
            margin: EdgeInsets.only(left: 20,right: 20),
            padding: EdgeInsets.only(right: 15,left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blue[900],
            ),
            child: FlatButton(

              onPressed: _doLogin,
              child: Text("Login",style: TextStyle(color: Colors.white),),
            ),

          ),
          SizedBox(height: 40,),
          Text("Or connect using",style: TextStyle(color: Colors.grey),),
          SizedBox(height: 20,),
          Container(
            height: 70,
            width: double.infinity,
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 150,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue,
                  ) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Entypo.facebook,color: Colors.white,),
                      Text("Facebook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                    ],
                  ),

                ),
                SizedBox(width: 20,),
                Container(
                  height: 40,
                  width: 150,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ) ,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Entypo.google_,color: Colors.white,),
                      Text("Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                    ],
                  ),

                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an acoount?"),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignUp.id);
                  },
                  child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),

        ],
      ),


    );
  }
}
