import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Prefs/Prefs.dart';
import 'package:flutter_app1/model/user_model.dart';
class SignUp extends StatefulWidget {
  static final String id="signup";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String showname="";
  String showphone="";
  String showpassemail="";
  String show="";
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final namecontroller=TextEditingController();
  final phonecontroller=TextEditingController();
  void _doReggister(){
    String email=emailcontroller.text.toString().trim();
    String password=passwordcontroller.text.toString().trim();
    String name=namecontroller.text.toString().trim();
    String phone=phonecontroller.text.toString().trim();
    User user=User.fourelements(email:email,password:password,phonenumber:phone,name:name);
    Prefs.storeUser(user);
   setState(() {
     showphone=phone;
     showname=name;
     showpassemail=password;
     show=email;
   });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height: 70,),
          Text("Let's Get Started!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          SizedBox(height: 10,),
          Text("          Create an account to Q'Aliure to get all features",style: TextStyle(color: Colors.grey,fontSize: 15,),),

          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            padding: EdgeInsets.only(left: 15,right: 15),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white

            ),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.person,color: Colors.grey[300],),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            padding: EdgeInsets.only(left: 15,right: 15),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white

            ),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.email,color: Colors.grey[300],),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            padding: EdgeInsets.only(left: 15,right: 15),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white

            ),
            child: TextField(
              controller: phonecontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Phone",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.phone_android,color: Colors.grey[300],),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            padding: EdgeInsets.only(left: 15,right: 15),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white

            ),
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.lock_outline,color: Colors.grey[300],),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30),
            padding: EdgeInsets.only(left: 15,right: 15),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white

            ),
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: Colors.grey),
                icon: Icon(Icons.lock_outline,color: Colors.grey[300],),
              ),
            ),
          ),
          SizedBox(height: 20,),
         Container(
           height: 70,
           width: 200,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(40),
             color: Colors.blue[800]
           ),
           child: Center(
             child:  FlatButton(


                 onPressed: _doReggister,
                 child: Text("CREATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
           ),
         ),
          SizedBox(height: 50,),
          Text("$showname $showpassemail $showphone $show"),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an acoount?"),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignUp.id);
                  },
                  child: Text("Login here",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),


        ],

      ),
    );
  }
}
