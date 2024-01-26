// ignore_for_file: non_constant_identifier_names

part of '../extension.dart';

extension BoolExtension on bool? {
  dynamic either({required is_true, required is_false}) {
    var condition = this ?? false;
    if (condition) {
      return is_true;
    } else {
      return is_false;
    }
  }
}
