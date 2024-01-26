part of 'consts.dart';

class _ConstsShadow {
  const _ConstsShadow();

  List<BoxShadow> get commonShadow => [
        BoxShadow(
          color: AppColor.greyField.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(1, 10),
        )
      ];

  List<BoxShadow> get commonShadow2 => [
        BoxShadow(
          color: AppColor.greyField.withOpacity(0.25),
          spreadRadius: 1,
          blurRadius: 7,
          offset: const Offset(0, 0),
        )
      ];
}
