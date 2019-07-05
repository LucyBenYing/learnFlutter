import 'package:json_annotation/json_annotation.dart';
//user.g.dart 将在我们运行生成命令后自动生成
part 'JsonToUser.g.dart';
//这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

// 自动生成的模型
class  JsonToUser {
  JsonToUser(this.name, this.email);
  String name;
  String email;

  // 不同的类使用不同的minxin即可
  factory JsonToUser.formJson(Map<String, dynamic> json) => _$JsonToUserFromJson(json);
    Map<String, dynamic> toJson() => _$JsonToUserToJson(this);
  
}
