class Todo {
  String title;
  String description;
  bool complete = false;
  String category;
  int dateMilliseconds;
  int timeMilliseconds;

  Todo(
      {required this.title,
      this.description = '',
      this.complete = false,
      required this.dateMilliseconds,
      required this.timeMilliseconds,
      this.category = 'Uncategorized'});

  Todo.fromMap(Map map)
      : title = map['title'] as String,
        description = map['description'] as String,
        complete = map['complete'] as bool,
        category = map['category'] as String,
        dateMilliseconds = map['dateMilliseconds'] as int,
        timeMilliseconds = map['timeMilliseconds'] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['complete'] = complete;
    data['category'] = category;
    data['dateMilliseconds'] = dateMilliseconds;
    data['timeMilliseconds'] = timeMilliseconds;
    return data;
  }

  void toggleCompleted() {
    complete = !complete;
  }
}
