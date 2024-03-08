part of 'ui_toolkit.dart';

class ValidationRequired implements Validation {
  ValidationRequired(String invalidMessage)
      : _invalidMessage = invalidMessage;

  @override
  ({bool isValid, String? message}) validate(String? value) {
    if (value?.isEmpty == false) {
      return (isValid: true, message: null);
    }
    return (isValid: false, message: _invalidMessage);
  }

  final String _invalidMessage;
}
