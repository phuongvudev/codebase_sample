import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ValueObjectBase<T extends Equatable> {
  final T value;

  const ValueObjectBase(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other.runtimeType == runtimeType) {
      (other as ValueObjectBase<T>).value == value;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$value';
}
