import 'package:flutter/material.dart';
import 'package:whisk_mobile_app/utils/GlobalData.dart';
import 'package:whisk_mobile_app/utils/getAPI.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  String get title => "My Recipes";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String message = '',
      newMessageText = '';
  String addMessage = '',
      newAddMessage = '';
  String searchMessage = '',
      newSearchMessage = '';

  String search = '',
      recipe = '';

  late List data;

  Future<String> getJSONData() async {
    var response = await http.get(
      // Encode the url
        Uri.parse('https://whiskapp.herokuapp.com/api/recipes'),
        // Only accept JSON response
        headers: {"Accept": "application/json"}
    );

    setState(() {
      // Get the JSON data
      data = json.decode(response.body)['results'];
    });

    return "Successful";
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}