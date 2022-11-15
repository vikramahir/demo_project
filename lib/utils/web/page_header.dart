import 'package:flutter/material.dart';


class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
    required this.headerTitle,
    this.headerButtonTitle = "Apply",
    this.headerButtonOnTap,
    this.horizontalPadding,
    this.showTrailingButton = true,
  }) : super(key: key);

  final String headerTitle;
  final String headerButtonTitle;
  final VoidCallback? headerButtonOnTap;
  final double? horizontalPadding;
  final bool showTrailingButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 24.5),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1024),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headerTitle,

            ),
            // if (showTrailingButton)
            //   ApplyButton(
            //     title: headerButtonTitle,
            //     onTap: headerButtonOnTap ?? () {},
            //   ),
          ],
        ),
      ),
    );
  }
}
