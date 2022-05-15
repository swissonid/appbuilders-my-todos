import 'todo_item.dart';

const _kNothingFound = -1;

class TodoList {
  TodoList({
    List<TodoItem>? todos,
  }) : _todos = todos ?? <TodoItem>[];

  final List<TodoItem> _todos;

  /// Creates the inserts the todo item
  /// if it is not yet exiting in the list otherwise
  /// it will be overwriten.
  void save(TodoItem todoItem) {
    final foundIndex = _todos.indexWhere(
      (element) => element.id == todoItem.id,
    );
    if (foundIndex == _kNothingFound) {
      _todos.add(todoItem);
    } else {
      _todos[foundIndex] = todoItem;
    }
  }

  void move(int fromIndex, int toIndex) {
    _todos.insert(toIndex, _todos.removeAt(fromIndex));
  }

  void removeAt(int index) {
    _todos.removeAt(index);
  }

  List<TodoItem> get doneItems =>
      _todos.where((element) => element.isDone).toList();

  List<TodoItem> get openItems =>
      _todos.where((element) => !element.isDone).toList();

  int get amountOfDoneItems => doneItems.length;

  int get amountOfUndoneItems => openItems.length;

  operator [](int i) => _todos[i]; // get

  bool get isEmpty => _todos.isEmpty;

  int get length => _todos.length;

  TodoItem get first => _todos.first;

  TodoItem get last => _todos.last;

  List<TodoItem> toList() => [..._todos];
}
