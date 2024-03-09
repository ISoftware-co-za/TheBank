part of 'ui_toolkit.dart';

class Field extends ChangeNotifier {

  final String label;
  late final Property<String?> value;
  late final Property<bool> isValid;
  late final Property<String?> invalidMessage;

  Field(this.label, String? value) {
    this.value = Property(null, this);
    isValid = Property(true, this);
    invalidMessage = Property("", this);
    this.value.value = value;
  }

  void addValidation(Validation validation) {
    _validations.add(validation);
  }

  bool validateValue() {
    var validationResult = _validations.validate(value.value);
    isValid.value = validationResult.isValid;
    invalidMessage.value = validationResult.message;
    return validationResult.isValid;
  }

  void stateChanged() {
    notifyListeners();
  }

  final ValidationList _validations = ValidationList();
}
