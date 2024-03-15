import 'package:bank/model/model.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';
import 'package:bank/ui/selector_name_value/list_item_name_value.dart';

class ValueGeneratorBranch implements IValuesGenerator {

  ValueGeneratorBranch(List<Branch> branches) : _branches = branches;

  @override
  List<ListItemNameValue> generate() {
    _values ??= _branches.map((branch) => ListItemNameValue(branch.name, branch.code)).toList();
    return _values!;
  }

  final List<Branch> _branches;
  List<ListItemNameValue>? _values;
}
