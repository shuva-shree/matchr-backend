import 'package:flutter/material.dart';
import 'package:loginapp/screens/sign_up_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  late String _email;
  late String _password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget? _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Please enter a valid e-mail address';
        }
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget? _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Icon(Icons.visibility_off),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
      },
      onSaved: (String? value) {
        _password = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // color: Theme.of(context).accentColor,
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.35,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: _buildEmail()),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: _buildPassword()),
                  ],
                )),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: width * 0.3,
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 4),
                  // color: Colors.pinkAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.pinkAccent,
                  ),
                  
                  child: TextButton(
                    onPressed: (){
                      if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        _formkey.currentState!.save();
                    },
                    child: Text(
                      'Log In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        
                      ),
                    ),
                  ),
                ),
              
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Does not have an account?'),
                    TextButton(
                      onPressed: () {
                        
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
