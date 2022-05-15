import 'package:flutter_test/flutter_test.dart';
import 'package:my_todos_core/core.dart';

void main() {
  group('TodoList ', () {
    test('should be empty when create a todo list', () {
      final todoList = TodoList();
      expect(todoList.isEmpty, isTrue);
    });
    test('shoud length should be zero', () {
      final todoList = TodoList();
      expect(todoList.length, 0);
    });

    group('Save testing', () {
      test('should add new item', () {
        final todoList = TodoList();
        final newTodItem = TodoItem(title: 'Hallo');
        todoList.save(newTodItem);
        expect(todoList.length, 1);
        expect(todoList.isEmpty, isFalse);
      });

      test('should repace updateItem', () {
        final todoList = TodoList();
        final newTodItem = TodoItem(title: 'Hallo');
        todoList.save(newTodItem);
        expect(todoList.length, 1);
        expect(todoList.isEmpty, isFalse);
      });
    });

    test('move - should change the location of the itme', () {
      final itemOne = TodoItem(title: 'Item One');
      final itemTwo = TodoItem(title: 'Item two');
      final itemThree = TodoItem(title: 'Item three');
      final todoList = TodoList(todos: [itemOne, itemTwo, itemThree]);
      //Check preconditions
      expect(todoList.first, itemOne);
      expect(todoList.last, itemThree);

      todoList.move(0, 2);

      expect(todoList.first, itemTwo);
      expect(todoList.last, itemOne);
    });

    group('doneItems - Tests', () {
      test('doneItems - should be empty if the list is empty', () {
        expect(TodoList().doneItems.isEmpty, isTrue);
      });
      test('doneItems - should be empty if no items is done', () {
        expect(
            TodoList(
              todos: [
                TodoItem(
                  title: 'Not Done yet',
                ),
              ],
            ).doneItems.isEmpty,
            isTrue);
      });
      test('doneItems - should be empty if no items is done', () {
        expect(
            TodoList(
              todos: [
                TodoItem(title: 'Is done', isDone: true),
              ],
            ).doneItems.length,
            1);
      });
    });

    group('openItems - Tests', () {
      test('openItems - should be empty if the list is empty', () {
        expect(TodoList().openItems.isEmpty, isTrue);
      });
      test('openItems - should not be empty if no items is done', () {
        expect(
            TodoList(
              todos: [
                TodoItem(
                  title: 'Not Done yet',
                ),
              ],
            ).openItems.length,
            1);
      });
      test('openItems - should be empty if all items are done', () {
        expect(
            TodoList(
              todos: [
                TodoItem(title: 'Is done', isDone: true),
              ],
            ).openItems.isEmpty,
            isTrue);
      });
    });
  });
}
