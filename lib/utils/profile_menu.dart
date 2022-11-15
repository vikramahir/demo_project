import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 56,
        vertical: 56,
      ),
      color: Colors.white,
      child: Wrap(
        children: [
          // TODO: Best practicify this
          _buttonRow(
            "assets/images/compass.svg",
            "Explore Products",
            () => Get.toNamed(
              'Routes.exploreProducts',
              preventDuplicates: false,
            ),
          ),
          _buttonRow(
            'GlorifiAssets.chatBubble',
            "Help and Support",
            () {
              Get.toNamed(
                'Routes.faqCategoriesListingScreen',
                preventDuplicates: false,
              );
            },
          ),
          _buttonRow(
            "assets/images/share.svg",
            "Share app download link",
            () {},
          ),
          _buttonRow(
            "assets/images/profile.svg",
            "Profile and Settings",
            () {
              Get.toNamed(
                'Routes.editProfileLanding',
                preventDuplicates: false,
              );
            },
          ),
          _buttonRow(
            "assets/images/legal_icon.svg",
            "About and Legal",
            () => Get.toNamed('Routes.settings', preventDuplicates: false),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Divider(
              color: Colors.green,
              thickness: 0.5,
            ),
          ),
          _buttonRow(
            "assets/images/logout.svg",
            "Sign Out",
            () => {},
          ),
          // if (Environment().config is DevConfig)
          //   _buttonRow(
          //     "assets/icons/alert_circle.svg",
          //     "Developer Options",
          //     _showDevOptionsModal,
          //     color: GlorifiColors.darkRed,
          //   ),
        ],
      ),
    );
  }

  // _showLogoutDialog(BuildContext context) {
  //   final sessionManager = Get.find<SessionManagerService>();
  //   showDialog(
  //       context: context,
  //       useRootNavigator: true,
  //       builder: (BuildContext context) {
  //         return LogoutDialog(onLogoutConfirm: () {
  //           sessionManager.logout();
  //         });
  //       });
  // }
  //
  // _showDevOptionsModal() {
  //   Get.bottomSheet(
  //     Consumer<GlobalAppStateNotifier>(builder: (context, appState, child) {
  //       return Container(
  //         padding: const EdgeInsets.all(20),
  //         color: Colors.white,
  //         height: Get.height * 0.8,
  //         child: Column(children: [
  //           Text(
  //             'These options are available only for builds with DEV config.',
  //             style: TextStyle(
  //               fontWeight: FontWeight.w700,
  //             ),
  //           ),
  //           Row(
  //             children: [
  //               Expanded(child: Text('Use sandbox environment for Plaid')),
  //               Switch(
  //                   value: appState.isPlaidSandbox,
  //                   onChanged: (val) {
  //                     appState.togglePlaidSandbox();
  //                     Get.put(PlaidController()).getPlaidLinkToken();
  //                   })
  //             ],
  //           )
  //         ]),
  //       );
  //     }),
  //     barrierColor: GlorifiColors.barrierColor,
  //     isDismissible: true,
  //   );
  // }
  //
  Widget _buttonRow(
    String iconName,
    String title,
    Function() onTap, {
    Color color = Colors.blue,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24,
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconName, height: 20, width: 20, color: color),
            SizedBox(
              width: 25,
            ),
            Text(
              title,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
