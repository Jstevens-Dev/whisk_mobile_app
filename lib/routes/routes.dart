import 'package:flutter/material.dart';
import 'package:whisk_mobile_app/screens/LoginScreen.dart';
import 'package:whisk_mobile_app/screens/RecipesScreen.dart';
import 'package:whisk_mobile_app/screens/recipes_list.dart';

class Routes {
  static const String LOGINSCREEN = '/login';
  static const String RECIPESSCREEN = '/recipes';
  static const String RECIPESLIST = '/recipeslist';

  // routes of pages in the app
  static Map<String, Widget Function(BuildContext)> get getroutes =>
      {
        '/': (context) => LoginScreen(),
        LOGINSCREEN: (context) => LoginScreen(),
        RECIPESSCREEN: (context) => RecipesScreen(),
        RECIPESLIST: (context) => RecipeList(),
      };
}
