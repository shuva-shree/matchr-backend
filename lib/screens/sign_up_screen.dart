import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/screens/main_screen.dart';


class SignUpScreen extends StatelessWidget {

  late String _name;
  late String _email;
  late String _password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: InputBorder.none,
      ),
        // maxLength: 10,
      validator: (String? value){
        if(value!.isEmpty ){
          return 'Name is required';
        }
      },
      onSaved: (String? value){
        _name = value!;
      },
      
    );
  }

   Widget? _buildEmail(){
     return  TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: InputBorder.none,
        suffixIcon:Icon(Icons.email),
      ),
      validator: (String? value){
        if(value!.isEmpty ){
          return 'Email is required';
        }

        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return 'Please enter a valid e-mail address';
        } 
      },
      onSaved: (String? value){
        _email = value!;
      },
      
    );
  }

   Widget? _buildPassword(){
     return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        border: InputBorder.none,
        suffixIcon:Icon(Icons.visibility_off),
        ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value){
        if(value!.isEmpty ){
          return 'Password is required';
        }
      },
      onSaved: (String? value){
        _password = value!;
      },
      
    );
  }


    _textBox(String title , Icon? icon, bool obsureValue, Widget builders) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 4, color: Colors.pink, ),],
          ),
        
          child: builders,
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Theme.of(context).accentColor),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Sign up!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    _textBox('Your Name',null, false,_buildName()),
              SizedBox(
                height: 20,
              ),
              _textBox('Your Email', Icon(Icons.email), false,_buildEmail()!),
              SizedBox(
                height: 20,
              ),
              _textBox('Your Password', Icon(Icons.visibility_off),true, _buildPassword()!),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 140,
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 4, 
                      color: Colors.pink
                      ),
                    ],
                ),
                child: GestureDetector(
                  onTap: () {
                    if(!_formkey.currentState!.validate()){
                      return;
                    }
                    _formkey.currentState!.save();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  
                  child: Text(
                    'Register',
                    
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),
             ],
           )
            
           )
            ],
          ),
        ),
      ),
    );
  }
}
