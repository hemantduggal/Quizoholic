import 'package:flutter/material.dart';

import '../Networking/web.dart';
import '../Widgets/toast_demo.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final email = TextEditingController();
  final password = TextEditingController();


  void checkLogin()
  {
    if(email.text.length<10)
    {
      showFlutterToast("Invalid Email");
      return;
    }
    else if(email.text.contains('@')==false)
    {
      showFlutterToast("Invalid Email");
      return;
    }
    else if(password.text.length<3)
    {
      showFlutterToast("Password must be 3 length");
      return;
    }
    storeLoginData();
  }


  void storeLoginData() async
  {
    var s = await storeLogin(email.text, password.text);
    print("  email :  " + s);
    if(email.text == s.toString().trim())
    {
      Navigator.popAndPushNamed(context, '/');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [

            Spacer(),
            Spacer(),

            Image(image: AssetImage("assets/images/icon.png"),width: 150,),
            Text("Please Signup",style: TextStyle(fontSize: 25,color: Colors.black),),


            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Email',
                  hintText: 'Enter Email',
                ),


              ),
            ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(
                  ),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),


              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  checkLogin();
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontSize: 20),),),
                ),
              ),
            ),


            Spacer(),

            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/');
                },
                child: Text("Already a User? SignIn",style: TextStyle(fontSize: 18),)),
            Spacer(),
            Spacer(),

          ],
        ),
      ),
    );
  }
}
