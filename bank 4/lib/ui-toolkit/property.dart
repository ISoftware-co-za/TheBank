part of 'ui_toolkit.dart';

typedef PropertyChangeCallback<T> = void Function(T? value);

class Property<T> {
  T? get value => _value;
  set value(T? value) {
    if (value != _value) {
      _value = value;
      _field.stateChanged();
    }
  }
  T? _value;

  Property(T? value, Field field) :
        _value = value,
  _field = field;

  final Field _field;
}
