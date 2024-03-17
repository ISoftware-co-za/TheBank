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
      isValid = isValid & field.validateValue();
    }
    return isValid;
  }

  Map<String, dynamic> getValues() {
    Map<String, dynamic> values = {};
    for (var field in fields) {
      values[field.key] = field.value;
    }
    return values;
  }

  List<String> getKeys() {
    List<String> keys = [];
    for (var field in fields) {
      keys.add(field.key);
    }
    return keys;
  }
}
