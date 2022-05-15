// ignore_for_file: public_member_api_docs, sort_constructors_first

class TodoItem implements Comparable<TodoItem> {
  final String title;
  final String? description;
  final bool isDone;
  final String _id;
  TodoItem._(this.title, this.description, this.isDone, this._id);

  factory TodoItem({
    required String title,
    String? description,
    bool isDone = false,
  }) {
    final id = DateTime.now().toIso8601String();
    return TodoItem._(title, description, isDone, id);
  }

  // If you want to customized the todoItem id or need a
  factory TodoItem.withCustomId({
    required String id,
    required String title,
    String? description,
    bool isDone = false,
  }) =>
      TodoItem._(title, description, isDone, id);

  String get id => _id;

  TodoItem copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) =>
      TodoItem._(
        title ?? this.title,
        description ?? this.description,
        isDone ?? this.isDone,
        _id,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoItem &&
        other.title == title &&
        other.description == description &&
        other._id == _id &&
        other.isDone == isDone;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ isDone.hashCode;

  @override
  String toString() =>
      'TodoItem(title: $title, description: $description, isDone: $isDone)';

  @override
  int compareTo(other) {
    if (isDone == other.isDone) return 0;
    if (isDone) return -1;
    if (other.isDone) return -1;
    return 1;
  }
}
