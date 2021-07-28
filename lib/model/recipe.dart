
/*
class Recipe{
  String title;
  String content;
  String instructions;
  String category;

  Recipe.fromJson(Map json)
      : title = json['title'],
        content = json['content'],
        instructions = json['instructions'],
        category = json['category'];

  Map toJson() {
    return {'title': title, 'content': content, 'instructions': instructions, 'category': category};
  }
}
*/

class Recipe {
  int id;
  String name;
  String img;
  String nickname;

  Recipe.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        img = json['img'],
        nickname = json['nickname'];

  Map toJson() {
    return {'id': id, 'name': name, 'img': img, 'nickname': nickname};
  }
}