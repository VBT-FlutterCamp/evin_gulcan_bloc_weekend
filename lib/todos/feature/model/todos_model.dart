import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'todos_model.g.dart';

@JsonSerializable()
class TodosModel extends INetworkModel<TodosModel> {
  TodosModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  @override
  TodosModel fromJson(Map<String, dynamic> json) {
    return _$TodosModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$TodosModelToJson(this);
  }
}
