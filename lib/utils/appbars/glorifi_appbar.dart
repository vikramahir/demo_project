import 'package:demo_project/utils/adaptive/adaptive_screen_type_layout.dart';
import 'package:demo_project/utils/adaptive/adaptive_sizing.dart';
import 'package:demo_project/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebAppBar extends StatelessWidget {
  final AdaptiveSizingInfo sizingInformation;

  const WebAppBar({required this.sizingInformation, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: sizingInformation.isDesktop
            ? Constant.webPadding
            : Constant.tabPadding,
      ),
      color: Colors.redAccent,
      width: double.infinity,
      height: 35.h,
      child: Row(
        children: [
          const Icon(
            Icons.call,
            color: Colors.white,
          ),
          SizedBox(width: 1.w),
          Text(
            '+91 8866332880',
            style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 5.w),
          const Icon(
            Icons.safety_check,
            color: Colors.white,
          ),
          SizedBox(width: 1.w),
          Text(
            'shreesoftwaresolutions',
            style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(
            Icons.email_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 1.w),
          Text(
            'info@shreesoftwaresolutions.in',
            style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class WebHeader extends StatelessWidget {
  final AdaptiveSizingInfo sizingInformation;

  const WebHeader({required this.sizingInformation, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: sizingInformation.isDesktop
              ? Constant.webPadding
              : Constant.tabPadding,
          vertical: 10.h),
      color: Colors.white,
      width: double.infinity,
      height: 100.h,
      child: Row(
        children: [
          const Image(image: AssetImage('images/shree_logo.jpeg')),
          const Spacer(),
          OnHover(
            builder: (isHovered) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 15.sp,
                    color: isHovered ? Colors.black : Colors.redAccent,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 15.w,
                    height: 1.5.h,
                    color: isHovered ? Colors.redAccent : null,
                  ),
                ],
              );
            },
          ),
          const SizedBox(width: 15.0),
          OnHover(
            builder: (isHovered) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_sharp,
                    size: 15.sp,
                    color: isHovered ? Colors.black : Colors.redAccent,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 15.w,
                    height: 1.5.h,
                    color: isHovered ? Colors.redAccent : null,
                  ),
                ],
              );
            },
          ),
          const SizedBox(width: 15.0),
          OnHover(
            builder: (isHovered) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.supervised_user_circle,
                    size: 15.sp,
                    color: isHovered ? Colors.black : Colors.redAccent,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 15.w,
                    height: 1.5.h,
                    color: isHovered ? Colors.redAccent : null,
                  ),
                ],
              );
            },
          ),
          const SizedBox(width: 15.0),
          OnHover(
            builder: (isHovered) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 15.sp,
                    color: isHovered ? Colors.black : Colors.redAccent,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Portfolio',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 15.w,
                    height: 1.5.h,
                    color: isHovered ? Colors.redAccent : null,
                  ),
                ],
              );
            },
          ),
          const SizedBox(width: 15.0),
          OnHover(
            builder: (isHovered) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    size: 15.sp,
                    color: isHovered ? Colors.black : Colors.redAccent,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 15.w,
                    height: 1.5.h,
                    color: isHovered ? Colors.redAccent : null,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHover({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: widget.builder(isHovered),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}

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
