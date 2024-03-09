part of 'ui_toolkit.dart';

class ValidationCharacterLength implements Validation {
  ValidationCharacterLength(
      {int? minimumCharacters,
      String? minimumCharactersMessage,
      int? maximumCharacters,
      String? maximumCharactersMessage})
      : _minimumCharacters = minimumCharacters,
        _minimumCharactersMessage = minimumCharactersMessage,
        _maximumCharacters = maximumCharacters,
        _maximumCharactersMessage = maximumCharactersMessage;

  @override
  ({bool isValid, String? message}) validate(String? value) {
    if (value != null) {
      if (_minimumCharacters != null && value.length < _minimumCharacters) {
        return (isValid: false, message: _minimumCharactersMessage);
      } else if (_maximumCharacters != null && value.length > _maximumCharacters) {
        return (isValid: false, message: _maximumCharactersMessage);
      }
    }
    return (isValid: true, message: null);
  }

  final int? _minimumCharacters;
  final String? _minimumCharactersMessage;
  final int? _maximumCharacters;
  final String? _maximumCharactersMessage;
}
