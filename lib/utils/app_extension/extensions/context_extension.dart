part of '../extension.dart';

extension ContextExtension on BuildContext {
  double scale({
    required double mobile,
    double? desktop,
    double? tablet,
  }) {
    return getValueForScreenType<double>(
      context: this,
      mobile: mobile,
      desktop: desktop,
      tablet: tablet,
    );
  }

  DeviceScreenType get deviceType {
    return getDeviceType(MediaQuery.of(this).size);
  }

  bool get ismobile {
    return (this).deviceType == DeviceScreenType.mobile;
  }

  bool get istablet {
    return (this).deviceType == DeviceScreenType.tablet;
  }

  bool get isdesktop {
    return (this).deviceType == DeviceScreenType.desktop;
  }

  bool get isdesktopOrTab {
    return (this).deviceType == DeviceScreenType.desktop ||
        (this).deviceType == DeviceScreenType.tablet;
  }

  Future<DateTime?> datePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final dateSected = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1800, 1, 1),
      lastDate: lastDate ?? DateTime.now(),
      context: this,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogTheme: const DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            colorScheme: const ColorScheme.light(
              primary: AppColor.mainOrange, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: AppColor.headerTile, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
    return dateSected;
  }
}
