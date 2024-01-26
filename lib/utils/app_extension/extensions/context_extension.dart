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
}
