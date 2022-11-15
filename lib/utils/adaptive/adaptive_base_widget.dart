import 'package:demo_project/utils/adaptive/adaptive_breakpoints.dart';
import 'package:demo_project/utils/adaptive/adaptive_sizing.dart';
import 'package:flutter/material.dart';

class AdaptiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, AdaptiveSizingInfo sizingInformation) builder;
  const AdaptiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var mediaQuery = MediaQuery.of(context);
        var sizingInformation = AdaptiveSizingInfo(
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize:
              Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
        );
        return builder(context, sizingInformation);
      },
    );
  }
}
