import 'package:demo_project/utils/adaptive/adaptive_screen_type.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

AdaptiveScreenType getDeviceType(MediaQueryData mediaQuery) {
  /// Commented out. Can consider shortest side POST MVP
  // double deviceWidth = mediaQuery.size.shortestSide;
  double deviceWidth = mediaQuery.size.width;

  if (deviceWidth > 1024) {
    return AdaptiveScreenType.desktop;
  }

  if (deviceWidth > 450) {
    return AdaptiveScreenType.tablet;
  }

  return kIsWeb
      ? AdaptiveScreenType.webMobile
      : AdaptiveScreenType.nativeMobile;
}
