import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whisk_mobile_app/utils/getAPI.dart';
import 'package:whisk_mobile_app/utils/GlobalData.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String message = "", newMessageText = '';

  String email = '', password = '';

  @override
  void initState() {
    super.initState();
  }

  changeText() {
    setState(() {
      message = newMessageText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      controller: _emailController,
                      onChanged: (text) {
                        email = _emailController.text;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Login Name',
                          hintText: 'Enter Your Login Name'
                      ),
                    ),
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: TextField(
                      controller: _passwordController,
                      onChanged: (text) {
                        password = _passwordController.text;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Your Password'
                      ),
                    ),
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  RaisedButton(
                      child: Text('Do Login',
                          style: TextStyle(fontSize: 14, color: Colors.black)
                      ),
                      onPressed: () async
                      {
                        newMessageText = "";
                        changeText();

                        String payload = '{"email":"' + email.trim() + '","password":"' + password.trim() + '"}';

                        var userId;
                        var jsonObject;

                        try
                        {
                          String url = 'https://whiskapp.herokuapp.com/api/users/login';
                          String ret = await RecipesData.getJson(url, payload);
                          jsonObject = json.decode(ret);
                          userId = jsonObject["_id"];
                        }
                        on _MainPageState catch(e)
                        {
                          newMessageText = e.message;
                          changeText();
                          return;
                        }

                        if( userId == '' )
                        {
                          newMessageText = "Incorrect Login/Password";
                          changeText();
                        }
                        else
                        {
                          GlobalData.userId = userId;
                          GlobalData.name = jsonObject["name"];
                          GlobalData.email = email;
                          GlobalData.password = password;
                          Navigator.pushNamed(context, '/recipeslist');
                        }
                      },
                      color: Colors.brown[50],
                      textColor: Colors.black,
                      padding: EdgeInsets.all(2.0),
                      splashColor: Colors.grey[100]
                  ),
                ]
            ),
            Row(
                children: <Widget>[
                  Text('$message', style: TextStyle(fontSize: 14, color:Colors.black)),
                ]
            ),
          ]
      ),
    );
  }
}