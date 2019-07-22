

// 最开始 简单的模型
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      email = json['email'];

  Map<String, dynamic> toJson() => 
  {
    'name': name,
    'email': email,
  };

}

