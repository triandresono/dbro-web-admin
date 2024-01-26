part of '../extension.dart';

extension ListCaseExtension on List<Case> {
  bool get is_loading {
    return (this).any((e) => e is LoadingCase);
  }
}
