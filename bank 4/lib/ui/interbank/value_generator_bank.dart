import 'package:bank/model/model.dart';
import 'package:bank/ui-toolkit/ui_toolkit.dart';
import 'package:bank/ui/selector_name_value/list_item_name_value.dart';

class ValueGeneratorBank implements IValuesGenerator {

  ValueGeneratorBank(List<Bank> banks) : _banks = banks;

  @override
  List<ListItemNameValue> generate() {
    return _banks.map((bank) => ListItemNameValue(bank.name, bank.id)).toList();
  }

  final List<Bank> _banks;
}
