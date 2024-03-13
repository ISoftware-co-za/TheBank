part of 'ui_toolkit.dart';

class Field extends ChangeNotifier {

  final String label;

  String? get value => _value;
  set value(String? val) {
    _value = val;
    stateChanged();
  }
  String? _value;

  bool get isValid => _isValid;
  set isValid(bool val) {
    _isValid = val;
    stateChanged();
  }
  bool _isValid = true;

  String? get invalidMessage => _invalidMessage;
  set invalidMessage(String? val) {
    _invalidMessage = val;
    stateChanged();
  }
  String? _invalidMessage = "";

  Field(this.label, String? value) : _value = value;

  void addValidation(Validation validation) {
    _validations.add(validation);
  }

  bool validateValue() {
    var validationResult = _validations.validate(_value);
    _isValid = validationResult.isValid;
    _invalidMessage = validationResult.message;
    return validationResult.isValid;
  }

  void stateChanged() {
    notifyListeners();
  }

  final ValidationList _validations = ValidationList();
}
