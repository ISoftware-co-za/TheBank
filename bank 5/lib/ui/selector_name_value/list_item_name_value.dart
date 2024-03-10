class ListItemNameValue {
  final String name;
  final String value;

  ListItemNameValue(this.name, this.value);

  @override
  String toString() {
    return "$name - $value";
  }
}
