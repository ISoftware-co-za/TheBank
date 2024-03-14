part of 'ui_toolkit.dart';

class FormItem {
  final String key;
  final FormItemSource source;
  final String label;
  final bool required;
  final String? requiredMessage;
  final int? maximumLength;
  final String? maximumLengthMessage;
  final List<FormItemKeyValue>? valueList;

  FormItem(this.key, this.source, this.label, this.required, [this.requiredMessage, this.maximumLength, this.maximumLengthMessage, this.valueList]);

  factory FormItem.fromJson(Map<String, dynamic> json) {
    return FormItem(
        json['key'],
        FormItemSource.values.firstWhere((e) => e.name == json['source']),
        json['label'],
        json['required'],
        json['requiredMessage'],
        json['maximumLength'],
        json['maximumLengthMessage'],
        json['valueList'] != null ? (json['valueList'] as List).map((e) => FormItemKeyValue.fromJson(e)).toList() : null);
  }
}
