part of 'ui_toolkit.dart';

class Form {
  void add(Field field) {
    _fields.add(field);
  }

  bool validate() {
    bool isValid = true;
    for (var field in _fields) {
      isValid = field.validateValue();
    }
    return isValid;
  }

  final List<Field> _fields = [];
}
