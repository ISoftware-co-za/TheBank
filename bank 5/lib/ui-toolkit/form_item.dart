part of 'ui_toolkit.dart';

class FormItem {
  final String key;
  final FormItemSource source;
  final String label;
  final bool required;
  final int? maxLength;
  final List<FormItemKeyValue>? valueList;

  FormItem(this.key, this.source, this.label, this.required, [this.maxLength, this.valueList]);
}
