import 'package:dart_linked_list/node.dart';

class SinglyLinkedList<T> {
  final Node<T> _head;

  SinglyLinkedList()
      : _head = Node<T>(startNode: true, next: Node<T>(endNode: true));

  int get count {
    var current = _head.next;
    var count = 0;

    while (!current.endNode) {
      count++;
      current = current.next;
    }

    return count;
  }

  Node<T> get first {
    return _head.next.endNode ? null : _head.next;
  }

  Node<T> get last {
    var current = _head;

    if (current.next.endNode) {
      return null;
    }

    while (!current.next.endNode) {
      current = current.next;
    }

    return current;
  }

  void insertFirst(T value) {
    var node = Node<T>(value: value);
    node.next = _head.next;
    _head.next = node;
  }

  void insertLast(T value) {
    var node = Node<T>(value: value);
    var current = _head;

    while (!current.next.endNode) {
      current = current.next;
    }

    node.next = current.next;
    current.next = node;
  }

  bool removeFirst() {
    if (_head.next.endNode) {
      return false;
    }

    _head.next = _head.next.next;
    return true;
  }

  bool removeLast() {
    var current = _head;

    if (current.next.endNode) {
      return false;
    }

    while (!current.next.next.endNode) {
      current = current.next;
    }

    current.next = current.next.next;
    return true;
  }

  bool remove(T value) {
    var current = _head;

    if (current.next.next.endNode && current.next.value == value) {
      current.next = current.next.next;
      return true;
    }

    while (!current.next.endNode) {
      if (current.next.value == value) {
        current.next = current.next.next;
        return true;
      }

      current = current.next;
    }

    return false;
  }

  Node<T> find(T value) {
    var current = _head;

    while (!current.endNode) {
      if (current.value == value) {
        return current;
      }

      current = current.next;
    }

    return null;
  }
}
