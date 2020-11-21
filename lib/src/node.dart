class Node<T> {
  /// Start node indicator
  ///
  /// The first node in the linked list should have this flag set to true.
  /// It will make this node act as a guard.
  final bool startNode;

  /// End node indicator
  ///
  /// The last node in the linked list should have this flag set to true.
  /// It will make this node act as a guard.
  final bool endNode;

  /// The value this node contains.
  T value;

  /// Next node in the linked list.
  Node<T> next;

  /// Node that is used as an element in [SinglyLinkedList].
  Node({this.startNode = false, this.endNode = false, this.value, this.next});
}
