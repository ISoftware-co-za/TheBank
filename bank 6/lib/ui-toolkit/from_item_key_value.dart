part of 'ui_toolkit.dart';

class FormItemKeyValue {
  final String key;
  final String value;

  FormItemKeyValue(this.key, this.value);

  factory FormItemKeyValue.fromJson(Map<String, dynamic> json) {
    return FormItemKeyValue(
      json['key'],
      json['value']
    );
  }
}
