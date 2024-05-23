class Todo {
  Todo({
    required this.title,
    required this.desc,
    required this.status,
    required this.createdAt,
    required this.id,
  });
  late final String title;
  late final String desc;
  late final bool status;
  late final String createdAt;
  late final String id;
  
  Todo.fromJson(Map<String, dynamic> json){
    title = json['title'];
    desc = json['desc'];
    status = json['status'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}