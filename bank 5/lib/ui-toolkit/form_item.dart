part of 'ui_toolkit.dart';

class FormItem {
  final String key;
  final FormItemSource source;
  final String label;
  final bool required;
  final String? requiredMessage;
  final int? maxLength;
  final String? maxLengthMessage;
  final List<FormItemKeyValue>? valueList;

  FormItem(this.key, this.source, this.label, this.required, [this.requiredMessage, this.maxLength, this.maxLengthMessage, this.valueList]);
}
