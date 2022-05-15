import 'package:flutter_test/flutter_test.dart';
import 'package:my_todos_core/core.dart';

void main() {
  group('TodoItem tests', () {
    test('should have an  id', () {
      final item = TodoItem(title: 'Just a test');
      expect(item.id, allOf(isNotNull, isNotEmpty));
    });

    test('two todoItems should have the same uuid', () {
      final item = TodoItem(title: 'Just a test');
      final item2 = TodoItem(title: 'Just a test');
      expect(item.id != item2.id, isTrue);
    });

    test('opertor == should compare the whole', () {
      final item = TodoItem(title: 'Just A tast');
      final anOtherItem = item.copyWith();
      final itemWithDescription =
          item.copyWith(description: 'Just a description');
      expect(item == anOtherItem, isTrue);
      expect(item == itemWithDescription, isFalse);
    });
  });
}
