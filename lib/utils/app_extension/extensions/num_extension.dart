part of '../extension.dart';

extension NumExtension on num {
  String get dotSeparator {
    return (this).toInt().toString().thousandSeparator;
  }
}
