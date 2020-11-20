import 'package:dart_linked_list/singly_linked_list.dart';
import 'package:test/test.dart';

void main() {
  test(
      'SinglyLinkedList.insertFirst() inserts first and SinglyLinkedList.first gets first',
      () {
    var singlyLinkedList = SinglyLinkedList<int>();

    singlyLinkedList.insertFirst(1);
    expect(singlyLinkedList.first.value, equals(1));

    singlyLinkedList.insertFirst(2);
    expect(singlyLinkedList.first.value, equals(2));
  });

  test(
      'SinglyLinkedList.insertLast() inserts last and SinglyLinkedList.last gets lasts',
      () {
    var singlyLinkedList = SinglyLinkedList<int>();

    singlyLinkedList.insertFirst(1);
    singlyLinkedList.insertLast(2);
    expect(singlyLinkedList.first.value, equals(1));
    expect(singlyLinkedList.last.value, equals(2));
  });

  test('SinglyLinkedList.removeFirst() removes first', () {
    var singlyLinkedList = SinglyLinkedList<int>();

    singlyLinkedList.insertFirst(1);
    singlyLinkedList.removeFirst();
    expect(singlyLinkedList.first, equals(null));

    singlyLinkedList.insertFirst(1);
    singlyLinkedList.insertLast(2);
    singlyLinkedList.removeFirst();
    expect(singlyLinkedList.first.value, equals(2));
  });

  test('SinglyLinkedList.removeLast() removes last', () {
    var singlyLinkedList = SinglyLinkedList<int>();

    singlyLinkedList.insertFirst(1);
    singlyLinkedList.removeLast();
    expect(singlyLinkedList.last, equals(null));

    singlyLinkedList.insertFirst(1);
    singlyLinkedList.insertFirst(2);
    singlyLinkedList.removeLast();
    expect(singlyLinkedList.last.value, equals(2));
  });

  test('SinglyLinkedList.remove() removes correct element', () {
    var singlyLinkedList = SinglyLinkedList<int>();

    singlyLinkedList.insertFirst(1);
    expect(singlyLinkedList.remove(2), equals(false));
    expect(singlyLinkedList.first.value, equals(1));
    expect(singlyLinkedList.remove(1), equals(true));
    expect(singlyLinkedList.first, equals(null));

    singlyLinkedList.insertFirst(1);
    singlyLinkedList.insertFirst(2);
    singlyLinkedList.insertFirst(3);
    expect(singlyLinkedList.remove(2), equals(true));
    expect(singlyLinkedList.remove(1), equals(true));
    expect(singlyLinkedList.first.value, equals(3));
  });

  test('SinglyLinkedList.find() returns correct node', () {
    var singlyLinkedList = SinglyLinkedList<int>();

    singlyLinkedList.insertFirst(1);
    expect(singlyLinkedList.find(1).value, equals(1));
    expect(singlyLinkedList.find(2), equals(null));

    singlyLinkedList.insertLast(2);
    expect(singlyLinkedList.find(3), equals(null));
    expect(singlyLinkedList.find(1).value, equals(1));
    expect(singlyLinkedList.find(2).value, equals(2));
  });
}
