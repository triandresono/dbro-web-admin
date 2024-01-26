import 'package:dbro_admin/ui_kit/generated_theme/fonts.gen.dart';
import 'package:flutter/material.dart';

enum AppFontWeight {
  light,
  regular,
  medium,
  semiBold,
  bold,
  extraBold,
}

extension AppFontWeightExtension on AppFontWeight {
  FontWeight get value {
    switch (this) {
      case AppFontWeight.light:
        return FontWeight.w300;
      case AppFontWeight.regular:
        return FontWeight.w400;
      case AppFontWeight.medium:
        return FontWeight.w500;
      case AppFontWeight.semiBold:
        return FontWeight.w600;
      case AppFontWeight.bold:
        return FontWeight.w700;
      case AppFontWeight.extraBold:
        return FontWeight.w800;
      default:
        return FontWeight.w200;
    }
  }
}

class AppFontType {
  const AppFontType(
    this.family,
    this._size,
    this._tabletSize,
    this._isFixedSize,
  );

  static AppFontLoader appFontLoader = const AppFontLoader();

  final String family;
  final double _size;
  final double _tabletSize;
  final bool _isFixedSize;

  TextStyle light({
    Color? color = Colors.black,
    TextDecoration? decoration = TextDecoration.none,
  }) =>
      appFontLoader.textStyle(
        family,
        AppFontWeight.light.value,
        FontStyle.normal,
        _size,
        tabletSize: _tabletSize,
        isFixedSize: _isFixedSize,
        color: color,
        decoration: decoration,
      );

  TextStyle regular({
    Color? color = Colors.black,
    TextDecoration? decoration = TextDecoration.none,
  }) =>
      appFontLoader.textStyle(
        family,
        AppFontWeight.regular.value,
        FontStyle.normal,
        _size,
        tabletSize: _tabletSize,
        isFixedSize: _isFixedSize,
        color: color,
        decoration: decoration,
      );

  TextStyle medium({
    Color? color = Colors.black,
    TextDecoration? decoration = TextDecoration.none,
  }) =>
      appFontLoader.textStyle(
        family,
        AppFontWeight.medium.value,
        FontStyle.normal,
        _size,
        tabletSize: _tabletSize,
        isFixedSize: _isFixedSize,
        color: color,
        decoration: decoration,
      );

  TextStyle semiBold({
    Color? color = Colors.black,
    TextDecoration? decoration = TextDecoration.none,
  }) =>
      appFontLoader.textStyle(
        family,
        AppFontWeight.semiBold.value,
        FontStyle.normal,
        _size,
        tabletSize: _tabletSize,
        isFixedSize: _isFixedSize,
        color: color,
        decoration: decoration,
      );

  TextStyle bold({
    Color? color = Colors.black,
    TextDecoration? decoration = TextDecoration.none,
  }) =>
      appFontLoader.textStyle(
        family,
        AppFontWeight.bold.value,
        FontStyle.normal,
        _size,
        tabletSize: _tabletSize,
        isFixedSize: _isFixedSize,
        color: color,
        decoration: decoration,
      );

  TextStyle extraBold({
    Color? color = Colors.black,
    TextDecoration? decoration = TextDecoration.none,
  }) =>
      appFontLoader.textStyle(
        family,
        AppFontWeight.extraBold.value,
        FontStyle.normal,
        _size,
        tabletSize: _tabletSize,
        isFixedSize: _isFixedSize,
        color: color,
        decoration: decoration,
      );

  TextStyle boldItalic({
    Color? color = Colors.black,
    TextDecoration? decoration = TextDecoration.none,
  }) =>
      appFontLoader.textStyle(
        family,
        AppFontWeight.bold.value,
        FontStyle.italic,
        _size,
        tabletSize: _tabletSize,
        isFixedSize: _isFixedSize,
        color: color,
        decoration: decoration,
      );
}

class AppFontFamily {
  const AppFontFamily(this._family);

  final String _family;

  AppFontType get size6 => AppFontType(_family, 6, 6, false);

  AppFontType get size7 => AppFontType(_family, 7, 7, false);

  AppFontType get size8 => AppFontType(_family, 8, 8, false);

  AppFontType get size10 => AppFontType(_family, 10, 10, false);

  AppFontType get size11 => AppFontType(_family, 11, 11, false);

  AppFontType get size12 => AppFontType(_family, 12, 12, false);

  AppFontType get size13 => AppFontType(_family, 13, 13, false);

  AppFontType get size14 => AppFontType(_family, 14, 14, false);

  AppFontType get size16 => AppFontType(_family, 16, 16, false);

  AppFontType get size17 => AppFontType(_family, 17, 17, false);

  AppFontType get size18 => AppFontType(_family, 18, 18, false);

  AppFontType get size20 => AppFontType(_family, 20, 20, false);

  AppFontType get size22 => AppFontType(_family, 22, 22, false);

  AppFontType get size23 => AppFontType(_family, 23, 23, false);

  AppFontType get size24 => AppFontType(_family, 24, 24, false);

  AppFontType get size28 => AppFontType(_family, 28, 28, false);

  AppFontType fontSize(
    double size, {
    double? tabletSize,
    bool isFixedSize = false,
  }) {
    return AppFontType(_family, size, tabletSize ?? size, isFixedSize);
  }

  AppFontType fixedSize(
    double size, {
    double? tabletSize,
  }) {
    return AppFontType(_family, size, tabletSize ?? size, true);
  }
}

extension RGFontTypeExtention on AppFontType {
  AppFontType merge({required double tabletSize}) {
    double newSize = _size;
    return AppFontType(family, newSize, newSize, false);
  }
}

class AppFontLoader {
  const AppFontLoader();

  TextStyle textStyle(
    String family,
    FontWeight weight,
    FontStyle style,
    double size, {
    double? tabletSize,
    bool isFixedSize = false,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontWeight: weight,
      fontStyle: style,
      fontSize: size,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      decoration: decoration,
    );
  }
}

class AppFontUtils {
  const AppFontUtils();

  AppFontFamily fontName(String fontName) => AppFontFamily(fontName);

  AppFontType size(double size) {
    return const AppFontFamily(FontFamily.hKGoretsk).fontSize(size);
  }

  AppFontType fix(double size) {
    return const AppFontFamily(FontFamily.hKGoretsk).fixedSize(size);
  }
}

class Font {
  static AppFontFamily get style {
    return const AppFontFamily(FontFamily.hKGoretsk);
  }

  static AppFontType size(double size) {
    return const AppFontFamily(FontFamily.hKGoretsk).fontSize(size);
  }

  static AppFontType fix(double size) {
    return const AppFontFamily(FontFamily.hKGoretsk).fixedSize(size);
  }
}

class Inter {
  static AppFontFamily get style {
    return const AppFontFamily(FontFamily.inter);
  }

  static AppFontType size(double size) {
    return const AppFontFamily(FontFamily.inter).fontSize(size);
  }

  static AppFontType fix(double size) {
    return const AppFontFamily(FontFamily.inter).fixedSize(size);
  }
}
