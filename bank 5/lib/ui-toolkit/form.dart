part of 'ui_toolkit.dart';

class FormX {
  final List<Field> fields = [];

  void add(Field field) {
    fields.add(field);
  }

  Field getField(String key) {
    return fields.firstWhere((f) => f.key == key);
  }

  bool validate() {
    bool isValid = true;
    for (var field in fields) {
      isValid = field.validateValue();
    }
    return isValid;
  }

}
