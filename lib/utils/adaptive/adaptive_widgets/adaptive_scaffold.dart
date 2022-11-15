import 'package:demo_project/utils/adaptive/adaptive_base_widget.dart';
import 'package:demo_project/utils/adaptive/adaptive_breakpoints.dart';
import 'package:demo_project/utils/adaptive/adaptive_screen_type.dart';
import 'package:demo_project/utils/adaptive/adaptive_sizing.dart';
import 'package:demo_project/utils/adaptive/adaptive_widgets/adaptive_grid.dart';
import 'package:demo_project/utils/appbars/glorifi_appbar.dart';
import 'package:demo_project/utils/profile_menu.dart';
import 'package:demo_project/utils/web/page_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AdaptiveScaffoldImpl {
  PreferredSizeWidget? appBar(
      BuildContext context, AdaptiveSizingInfo sizingInfo) {}

  PreferredSizeWidget? simpleAppBar(
      BuildContext context, AdaptiveSizingInfo sizingInfo) {}

  Widget bottomNavBar(BuildContext context, AdaptiveSizingInfo sizingInfo);

  Widget drawer(BuildContext context, AdaptiveSizingInfo sizingInfo);

  Widget? endDrawer(BuildContext context, AdaptiveSizingInfo sizingInfo);

  Widget getScaffold(
      {required BuildContext context,
      PreferredSizeWidget? glorifiAppBar,
      Color? backgroundColor,
      String? appBarTitle,
      required Widget body,
      Widget? bottomSheet,
      Widget? floatingActionButton,
      bool? resizeToAvoidBottomInset = true,
      bool isSimpleAppbar = false,
      bool isEndDrawerEnable = false}) {
    return AdaptiveBuilder(builder: (context, sizingInfo) {
      final _appBar = appBar(context, sizingInfo);
      final _bottomNavBar = bottomNavBar(context, sizingInfo);
      final _drawer = drawer(context, sizingInfo);
      final _endDrawer =
          isEndDrawerEnable ? endDrawer(context, sizingInfo) : null;
      final mediaQuery = MediaQuery.of(context);
      return Scaffold(
        endDrawer: _endDrawer,
        appBar: getDeviceType(mediaQuery) == AdaptiveScreenType.nativeMobile
            ? glorifiAppBar
            : _appBar,
        body: body,
        bottomNavigationBar: _bottomNavBar,
        bottomSheet: bottomSheet,
        drawer: _drawer,
        backgroundColor: backgroundColor ?? Colors.white,
        floatingActionButton: floatingActionButton,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      );
    });
  }
}

class AdaptiveScaffold extends StatelessWidget {
  AdaptiveScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.appBarTitle,
    this.bottomSheet,
    this.floatingActionButton,
    this.isSimpleAppBar = false,
    this.hideWebAppBar = false,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  PreferredSizeWidget? appBar;
  Color? backgroundColor;
  String? appBarTitle;
  Widget body;
  Widget? bottomSheet;
  Widget? floatingActionButton;
  bool isSimpleAppBar;
  bool hideWebAppBar;
  bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(builder: (context, sizingInfo) {
      if (sizingInfo.deviceType == AdaptiveScreenType.nativeMobile) {
        return AdaptiveScaffoldNative().getScaffold(
          context: context,
          glorifiAppBar: appBar,
          body: body,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor ?? Colors.white,
          floatingActionButton: floatingActionButton,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        );
      } else {
        return AdaptiveScaffoldWeb(
                isSimpleApp: isSimpleAppBar, hideWebAppBar: hideWebAppBar)
            .getScaffold(
          context: context,
          glorifiAppBar: appBar,
          body: body,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor ?? Colors.white,
          floatingActionButton: floatingActionButton,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          isEndDrawerEnable: true,
        );
      }
    });
  }
}

class AdaptiveScaffoldWeb extends AdaptiveScaffoldImpl {
  AdaptiveScaffoldWeb({
    Key? key,
    this.isSimpleApp = false,
    this.hideWebAppBar = false,
  });

  bool isSimpleApp;
  bool hideWebAppBar;

  @override
  PreferredSizeWidget? appBar(
      BuildContext context, AdaptiveSizingInfo sizingInfo) {
    return _AdaptiveAppBar(
      isSimpleAppbar: isSimpleApp,
      hideWebAppBar: hideWebAppBar,
    );
  }

  @override
  Widget bottomNavBar(BuildContext context, AdaptiveSizingInfo sizingInfo) {
    return SizedBox();
  }

  @override
  Widget drawer(BuildContext context, AdaptiveSizingInfo sizingInfo) {
    return _AdaptiveDrawer();
  }

  @override
  Widget? endDrawer(BuildContext context, AdaptiveSizingInfo sizingInfo) {
    return _AdaptiveEndDrawer();
  }
}

class AdaptiveScaffoldNative extends AdaptiveScaffoldImpl {
  AdaptiveScaffoldNative({
    Key? key,
  });

  @override
  Widget bottomNavBar(BuildContext context, AdaptiveSizingInfo sizingInfo) {
    return SizedBox();
  }

  @override
  Widget drawer(BuildContext context, AdaptiveSizingInfo sizingInfo) {
    return _AdaptiveDrawer();
  }

  @override
  Widget? endDrawer(BuildContext context, AdaptiveSizingInfo sizingInfo) {
    return _AdaptiveEndDrawer();
  }
}

class _AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AdaptiveAppBar({
    Key? key,
    this.isSimpleAppbar = false,
    this.hideWebAppBar = false,
  }) : super(key: key);

  final bool isSimpleAppbar;
  final bool hideWebAppBar;

  @override
  Widget build(BuildContext context) {
    Widget _glorifiTextLogo = Image.asset(
      'GlorifiAssets.simpleLogo',
      height: 26, //26.h,
      width: 170, //170.w,
    );

    Widget _menuIcon = GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Icon(
        Icons.menu,
        color: Colors.white,
        size: 24,
      ),
    );

    Widget _supportIcon = Icon(
      Icons.messenger_outline,
      color: Colors.white,
      size: 27.5,
    );

    Widget _profileIcon = GestureDetector(
      onTap: () => Scaffold.of(context).openEndDrawer(),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
    );

    return AdaptiveBuilder(builder: (context, sizingInfo) {
      if (hideWebAppBar) {
        return SizedBox.shrink();
      } else if (sizingInfo.deviceType == AdaptiveScreenType.desktop) {
        return Container(
          height: sizingInfo.screenSize.height,
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _glorifiTextLogo,
              isSimpleAppbar
                  ? SizedBox.shrink()
                  : Container(
                      width: 762,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _HeaderTitleWidget(
                            title: 'Banking',
                            imageAssets: 'GlorifiAssets.buildingCastle',
                          ),
                          _HeaderTitleWidget(
                            title: 'Insurance',
                            imageAssets: 'GlorifiAssets.creditCart',
                          ),
                          _HeaderTitleWidget(
                            title: 'Credit Card',
                            imageAssets: ' GlorifiAssets.shield',
                          ),
                          _HeaderTitleWidget(
                            title: 'Insight',
                            imageAssets: 'GlorifiAssets.home',
                          ),
                          _HeaderTitleWidget(
                            title: 'Loan',
                            imageAssets: 'GlorifiAssets.arrowup',
                          ),
                          _HeaderTitleWidget(
                            title: 'Support',
                            imageAssets: 'GlorifiAssets.chatBubble',
                          ),
                        ],
                      ),
                    ),
              isSimpleAppbar
                  ? SizedBox.shrink()
                  : Row(
                      children: [
                        _supportIcon,
                        SizedBox(width: 24),
                        _profileIcon,
                        SizedBox(width: 20),
                      ],
                    ),
            ],
          ),
        );
      } else if (sizingInfo.deviceType == AdaptiveScreenType.tablet) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: sizingInfo.screenSize.height,
          color: Colors.black,
          child: Row(
            children: [
              isSimpleAppbar ? SizedBox.shrink() : _menuIcon,
              const Spacer(),
              _glorifiTextLogo,
              const Spacer(),
              isSimpleAppbar ? SizedBox.shrink() : _supportIcon,
              SizedBox(width: 24),
              isSimpleAppbar ? SizedBox.shrink() : _profileIcon,
            ],
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: sizingInfo.screenSize.height,
          color: Colors.black,
          child: Row(
            children: [
              isSimpleAppbar ? SizedBox.shrink() : _menuIcon,
              const Spacer(),
              _glorifiTextLogo,
              const Spacer(),
              isSimpleAppbar ? SizedBox.shrink() : _supportIcon,
              SizedBox(width: 24),
              isSimpleAppbar ? SizedBox.shrink() : _profileIcon,
            ],
          ),
        );
      }
    });
  }

  @override
  Size get preferredSize => Size(1, 56);
}

class _AdaptiveDrawer extends StatelessWidget {
  const _AdaptiveDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      builder: (context, sizingInfo) {
        if (sizingInfo.deviceType == AdaptiveScreenType.desktop) {
          return Container();
        } else {
          return Container(
            color: Colors.black,
            width: 428,
            height: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(
                      height: 81,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.clear,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                    _AppDrawerItemWidget(
                      assetPath: 'GlorifiAssets.buildingCastle',
                      title: "Banking",
                    ),
                    SizedBox(height: 10),
                    _AppDrawerItemWidget(
                      assetPath: "GlorifiAssets.creditCart",
                      title: "Credit Card",
                    ),
                    SizedBox(height: 10),
                    _AppDrawerItemWidget(
                      assetPath: 'GlorifiAssets.shield',
                      title: "Insurance",
                    ),
                    SizedBox(height: 10),
                    _AppDrawerItemWidget(
                      assetPath: 'GlorifiAssets.home',
                      title: "Loan",
                    ),
                    SizedBox(height: 10),
                    _AppDrawerItemWidget(
                      assetPath: 'GlorifiAssets.arrowup',
                      title: "Insight",
                    ),
                    SizedBox(height: 10),
                    _AppDrawerItemWidget(
                      assetPath: 'GlorifiAssets.chatBubble',
                      title: "Support",
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class _AdaptiveEndDrawer extends StatelessWidget {
  const _AdaptiveEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      builder: (context, sizingInfo) {
        return Container(
          width: 428,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileMenu(),
            ],
          ),
        );
      },
    );
  }
}

class _HeaderTitleWidget extends StatelessWidget {
  const _HeaderTitleWidget({
    Key? key,
    required this.title,
    required this.imageAssets,
  }) : super(key: key);
  final String title;
  final String imageAssets;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SvgPicture.asset(imageAssets, height: 20.h, width: 20.w),
        // SizedBox(width: 8.w),
        // Text(
        //   title,
        //   style: captionSemiBold14Primary(
        //     color: GlorifiColors.white,
        //   ),
        // ),
      ],
    );
  }
}

class _AppDrawerItemWidget extends StatelessWidget {
  const _AppDrawerItemWidget({
    Key? key,
    required this.assetPath,
    required this.title,
  }) : super(key: key);

  final String assetPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      // width: 260.w,
      color: Color(0xff152951),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   assetPath,
          //   height: 20.h,
          //   width: 20.w,
          //   color: GlorifiColors.white,
          // ),
          SizedBox(width: 10),
          Text(
            title,
            // style: captionSemiBold14Primary(
            //   color: GlorifiColors.white,
            // ),
          ),
        ],
      ),
    );
  }
}

class AdaptiveScrollableScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final Color backgroundColor;
  final Widget? childNative;

  const AdaptiveScrollableScaffold(
      {Key? key,
      required this.child,
      required this.title,
      this.childNative,
      this.backgroundColor: Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      builder: (context, sizingInfo) {
        return AdaptiveScaffold(
          appBar: GlorifiAppBar(
            title: title,
          ),
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!sizingInfo.isNativeMobile)
                  PageHeader(
                      headerTitle: title,
                      showTrailingButton: false,
                      horizontalPadding: sizingInfo.isDesktop
                          ? 200
                          : sizingInfo.isTablet
                              ? 32
                              : 24),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sizingInfo.isDesktop
                          ? 200
                          : sizingInfo.isTablet
                              ? 32
                              : 24,
                      vertical: 50),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 1024,
                    ),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AdaptiveColumnScaffold extends StatelessWidget {
  final int length;
  final String title;
  final Function rowWidget;
  final Color backgroundColor;

  const AdaptiveColumnScaffold(
      {Key? key,
      required this.length,
      required this.rowWidget,
      required this.title,
      this.backgroundColor: Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScrollableScaffold(
      backgroundColor: backgroundColor,
      title: title,
      child: AdaptiveGrid(
        children: [
          ...List<AdaptiveGridItem>.generate(
              length,
              (index) => AdaptiveGridItem(
                    desktop: 50,
                    tablet: 50,
                    webMobile: 100,
                    nativeMobile: 100,
                    child: AdaptiveGridItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: rowWidget(
                          index,
                        ),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
