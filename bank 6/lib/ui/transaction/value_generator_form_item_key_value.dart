import 'package:bank/ui-toolkit/ui_toolkit.dart';

import '../selector_name_value/list_item_name_value.dart';

class ValueGeneratorFormItemKeyValue implements IValuesGenerator {
  ValueGeneratorFormItemKeyValue(List<FormItemKeyValue> values) : _values = values;

  @override
  List<ListItemNameValue> generate() {
    return _values.map((e) => ListItemNameValue(e.value, e.key)).toList();
  }

  final List<FormItemKeyValue> _values;
}
