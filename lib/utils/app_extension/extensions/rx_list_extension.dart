part of '../extension.dart';

extension BaseExList on RxList {
  void rxClear() {
    (this).clear();
    (this).refresh();
  }

  void rxAdd(dynamic val) {
    (this).add(val);
    (this).refresh();
  }

  void rxNew<T>(List<T>? val) {
    if (val != null) {
      (this)(val);
    } else {
      (this)([]);
    }
    (this).refresh();
  }

  void rxAddAll(List<dynamic>? val) {
    if (val != null) {
      (this).addAll(val);
    } else {
      (this)([]);
    }
    (this).refresh();
  }

  void rxRemove(dynamic val) {
    (this).remove(val);
    (this).refresh();
  }

  void rxRemoveAt(int val) {
    (this).removeAt(val);
    (this).refresh();
  }
}
