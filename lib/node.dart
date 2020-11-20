class Node<T> {
  final bool startNode;
  final bool endNode;
  T value;
  Node<T> next;

  Node({this.startNode = false, this.endNode = false, this.value, this.next});
}
