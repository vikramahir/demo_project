import 'package:demo_project/utils/adaptive/adaptive_screen_type_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class GlorifiAppBar extends StatelessWidget implements PreferredSizeWidget {
  GlorifiAppBar({
    Key? key,
    required this.title,
    this.textStyle,
    this.leading,
    this.trailing,
    this.elevation = 5,
    this.bgColor,
    this.toolbarHeight,
    this.leadingIconDefaultColor,
    this.disableLeading = false,
  }) : super(key: key);

  final String title;
  final TextStyle? textStyle;
  final Leading? leading;
  final Trailing? trailing;
  final double? elevation;
  final Color? bgColor;
  final Color? leadingIconDefaultColor;
  final bool disableLeading;
  // final bool? centerTitle;
  final double? toolbarHeight;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScreenLayout(
      mobile: AppBar(
        backgroundColor: bgColor ?? Colors.white,
        centerTitle: false,
        toolbarHeight: toolbarHeight,
        leadingWidth: leading?.text != null ? null : null,
        leading: !disableLeading
            ? leading?.text != null
                ? TextButton(
                    onPressed: leading?.onTap ?? Get.back,
                    child: Text(
                      "${leading?.text}",
                      maxLines: 1,
                    ),
                  )
                : IconButton(
                    icon: leading?.icon ??
                        SvgPicture.asset(
                         ' GlorifiAssets.careLeftSmall',
                          color: leadingIconDefaultColor,
                        ),
                    onPressed: leading?.onTap ?? Get.back,
                  )
            : Offstage(),
        elevation: elevation,
        title: Text(
          title,
        ),
        actions: [
          if (trailing != null)
            TextButton(
              onPressed: () {
                trailing!.onTap();
              },
              child: trailing!.text != null
                  ? Text(
                      trailing!.text!,

                    )
                  : trailing!.icon!,
            )
        ],
        shadowColor: Colors.black.withOpacity(0.25),
      ),
    );
  }
}

class Leading {
  final String? text;
  final VoidCallback? onTap;
  final Widget? icon;
  final TextStyle? textStyle;

  Leading({
    this.onTap,
    this.text,
    this.icon,
    this.textStyle,
  });
}

class Trailing {
  final String? text;
  final Function onTap;
  final Widget? icon;
  final TextStyle? textStyle;

  Trailing({
    this.text,
    this.icon,
    required this.onTap,
    this.textStyle,
  }) : assert(text != null || icon != null);
}
