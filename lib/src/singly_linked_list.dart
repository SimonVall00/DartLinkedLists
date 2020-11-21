import 'package:dart_linked_list/src/node.dart';

class SinglyLinkedList<T> {
  /// The first node in the linked list.
  final Node<T> _head;

  /// A generic singly linked list.
  ///
  /// [T] is the type of value that should be stored in the linked list.
  SinglyLinkedList()
      : _head = Node<T>(startNode: true, next: Node<T>(endNode: true));

  /// Gets the number of nodes with a value in this linked list.
  int get count {
    var current = _head.next;
    var count = 0;

    while (!current.endNode) {
      count++;
      current = current.next;
    }

    return count;
  }

  /// Gets the first node with a value from this linked list.
  ///
  /// Returns a `Node<T>` if there is an element in the list.
  /// Otherwise it returns `null`.
  Node<T> get first {
    return _head.next.endNode ? null : _head.next;
  }

  /// Gets the last node with a value from this linked list.
  ///
  /// Returns a `Node<T>` if there is an element in the list.
  /// Otherwise it returns `null`.
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

  /// Inserts a new node at the first location in the linked list with the value [value].
  void insertFirst(T value) {
    var node = Node<T>(value: value);
    node.next = _head.next;
    _head.next = node;
  }

  /// Inserts a new node at the last location in the linked list with the value [value].
  void insertLast(T value) {
    var node = Node<T>(value: value);
    var current = _head;

    while (!current.next.endNode) {
      current = current.next;
    }

    node.next = current.next;
    current.next = node;
  }

  /// Removes the first node in the linked list.
  ///
  /// Returns `true` if the first node could be removed, otherwise `false`.
  bool removeFirst() {
    if (_head.next.endNode) {
      return false;
    }

    _head.next = _head.next.next;
    return true;
  }

  /// Removes the last node in the linked list.
  ///
  /// Returns `true` if the last node could be removed, otherwise `false`.
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

  /// Removes the first node with the value [value] in the linked list.
  ///
  /// Returns `true`if the first node with the value [value] could be removed, otherwise `false`.
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

  /// Finds the firts node with the value [value].
  ///
  /// Returns the first node with the value [value] if one could be found, otherwise `null`.
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
