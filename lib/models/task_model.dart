class TaskModel{
  int? id;
  int? color;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? reminder;
  String? repeat;
  String? title;
  String? note;

  TaskModel(
      {this.id,
      this.color,
      this.isCompleted,
      this.date,
      this.startTime,
      this.endTime,
      this.reminder,
      this.repeat,
      this.title,
      this.note});

  TaskModel.fromJson(Map<String , dynamic >json){
    id = json["id"];
    color = json["color"];
    isCompleted = json["isCompleted"];
    date = json["date"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    reminder = json["reminder"];
    repeat = json["repeat"];
    note = json["note"];
    title = json["title"];
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic>data =<String,dynamic>{};
    data['id']=id;
    data['color']=color;
    data['isCompleted']=isCompleted;
    data['date']=date;
    data['startTime']=startTime;
    data['endTime']=endTime;
    data['note']=note;
    data['title']=title;
    data['reminder']=reminder;
    data['repeat']=repeat;
    return data;
  }

}