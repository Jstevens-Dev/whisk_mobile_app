import 'dart:async';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future getRecipes() {
    return http.get(Uri.parse("https://breakingbadapi.com/api/characters"));
  }
}