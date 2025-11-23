import '../models/todo_model.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent(this.todo);
}

class RemoveTodoEvent extends TodoEvent {
  final int index;

  RemoveTodoEvent(this.index);
}
