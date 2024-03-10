part of 'ui_toolkit.dart';

class ValidationList {

  ({bool isValid, String? message}) validate(String? value) {
    bool isValid = true;
    String? message;

    for(Validation validation in _validations) {
      ({bool isValid, String? message}) result = validation.validate(value);
      if (result.isValid == false) {
        isValid = false;
        message = result.message;
        break;
      }
    }
    return (isValid: isValid, message: message);
  }

  void add(Validation validation) {
    _validations.add(validation);
  }

  final List<Validation> _validations = [];
}

abstract class Validation {
  ({bool isValid, String? message}) validate(String? value);
}
