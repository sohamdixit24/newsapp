
import 'package:email_validator/email_validator.dart';
import "package:flutter/material.dart";

import 'home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,

      ),
     initialRoute: '/',
      routes: {
        "/":(context)=>const LoginPage(title:'News App'),
        "/home":(context)=> const HomePage(title: ""),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
   const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey= GlobalKey<FormState>();
    bool _isvalid=false;
    bool validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false ;
    }
    else if (regExp.hasMatch(value) && value.length==10) {
      return true;
    }
    return false;
  }
  movetoHome(BuildContext context){
    if(_formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, "/home");
    }

  }
  @override
  void initState() {
    _formKey.currentState?.reset();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            const Text(
                "News App",
                textAlign: TextAlign.center,
              ),

        ),
      body:SingleChildScrollView(
       child: Form(
         key: _formKey,
         child: Column(
            children: [
               Image.asset('images/login.png',fit: BoxFit.contain,),
              const SizedBox(
                height:20 ,
              ),
               const Text('Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(
                height: 10,
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 18.0),
                child:TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email/Mobile",
                    labelText:"Enter Email or Mobile Number",
                  ),
                  validator: (value){
                   if(value!.isEmpty){
                      return " Email/Mobile number cannot be empty";
                   }
                   _isvalid =EmailValidator.validate(value);
                   if( _isvalid || validateMobile(value) ) {
                       return "Enter valid email id or mobile number";
                     }
                   return null;
                  },
                ),
              ),
               Padding(padding: const EdgeInsets.symmetric(horizontal: 17.0,vertical: 18.0),
                child:TextFormField(
                  obscureText: true,
                    decoration: const InputDecoration(
                    hintText: "Password",
                    labelText:"Enter Password",
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length < 8){
                      return "Password should be minimum 8 characters";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: (){movetoHome(context);},
                child:const Text('Login'),
              ),
            ],
         ),
       ),
      ),
    );
  }
}
