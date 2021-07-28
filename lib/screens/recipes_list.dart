
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whisk_mobile_app/data/recipe_api.dart';
import 'package:whisk_mobile_app/model/recipe.dart';

class RecipeList extends StatefulWidget {
  //RecipeList({required Key key}) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  List<Recipe> recipeList = <Recipe>[];

  void getRecipesfromApi() async {
    RecipeApi.getRecipes().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        recipeList = list.map((model) => Recipe.fromJson(model)).toList();
      });
    });
  }


  @override
  void initState() {
    super.initState();
    getRecipesfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
      ),
      body: ListView.builder(
      itemCount: recipeList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(recipeList[index].name),
        );
      }),
      floatingActionButton: RaisedButton(
          child: Text('Logout',style: TextStyle(fontSize: 14 ,color:Colors.black)),
          onPressed: ()
          {
            Navigator.pushNamed(context, '/login');
          },
          color:Colors.brown[50],
          textColor: Colors.black,
          padding: EdgeInsets.all(2.0),
          splashColor: Colors.grey[100]
      ),
    );
  }
}