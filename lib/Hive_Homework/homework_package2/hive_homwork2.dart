import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Hive_Homework//db_service.dart';
import 'package:flutter_app1/Hive_Homework/homework_package2/hive_homwork21.dart';

import 'package:flutter_app1/Hive_Homework/models/user_model.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
class HomeworkPage2 extends StatefulWidget {
  static final String id="homeword2_page";
  @override
  _HomeworkPage2State createState() => _HomeworkPage2State();
}

class _HomeworkPage2State extends State<HomeworkPage2> {
  final passwordController=TextEditingController();
  final emailController=TextEditingController();

  void _doLogin(){
    String emailname=emailController.text.toString().trim();
    String password=passwordController.text.toString().trim();
    var model=new DataModel(email: emailname,password: password);
    HiveHomeDB().storeUser(model);
    var user=HiveHomeDB().loadUser();
    print(user.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.teal,
            height: 200,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25,),
                Container(
                  height: 50,
                  width: 50,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage('assets/images/q.png'),
                      //fit: BoxFit.cover
                    )
                  ),

                ),
                SizedBox(height: 10,),
                Text("Welcome",style: TextStyle(color: Colors.grey[400],fontSize: 17),),
                SizedBox(height: 5,),
                Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
              ],

            ),
          ),
          Expanded(

            child: Container(
              color: Colors.teal,
              child: Container(
               // padding: EdgeInsets.all(30),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(height: 60,),
                Padding(
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child:  Text("Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.6)),),),

                    Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText:" Enter Email",
                            hintStyle: TextStyle(color: Colors.grey[400])
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child:  Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: CupertinoColors.black.withOpacity(.6)),),),

                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText:" Enter Password",
                            hintStyle: TextStyle(color: Colors.grey[400])
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: Text("Forgot Password?",style: TextStyle(color: Colors.grey[500],fontSize: 16,fontWeight: FontWeight.w400,),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 50,right: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal
                      ),
                      child: Center(
                        child: FlatButton(
                          onPressed: _doLogin,
                          child: Text("SIgn In",style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.only(left: 35,right: 20),

                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 2,
                            width:150,
                            color: Colors.grey[200],
                            ),
                         Text("OR",style: TextStyle(color: Colors.grey[300]),),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 2,
                            width:150,
                            color: Colors.grey[200],
                          ),


                        ],

                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 25,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 100,right: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Feather.facebook,color: Colors.blue,),
                          Icon(AntDesign.twitter,color: Colors.blue,),
                          Icon(AntDesign.instagram,color: Colors.black,)

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 120,),
                          Text("Don't have an account?"),
                          GestureDetector(
                            onTap: (){Navigator.pushNamed(context, HomeWorkPage2.id);},
                            child: Text("SignUp",style: TextStyle(color: Colors.blue[600],fontWeight: FontWeight.bold),),
                          )

                        ],
                      ),
                    ),
                  ],
                ),


              ),
            )
          ),
        ],
      ),

    );
  }
}
