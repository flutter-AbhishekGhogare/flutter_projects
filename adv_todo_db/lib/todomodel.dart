class Task {
  final int id;
  final String task;
  final String explanation;
  final String date;
  final String status;

  const Task({
    required this.id,
    required this.task,
    required this.explanation,
    required this.date,
    required this.status
  });

  Map<String, Object?> toDoTask() {
    return {
      'id' : id,
      'task': task,
      'explanation': explanation,
      'date': date,
      'status': status,
    };
  }
}
