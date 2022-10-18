import 'package:demo_project/binding/dashboard_binding.dart';
import 'package:demo_project/binding/details_binding.dart';
import 'package:demo_project/routes/name_routes.dart';
import 'package:demo_project/screen/dashboard_screen.dart';
import 'package:demo_project/screen/details_screen.dart';
import 'package:get/get.dart';

class PageRoutes {
  static final pages = [
    GetPage(
        name: NameRoutes.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),

    GetPage(
        name: NameRoutes.detailsScreen,
        page: () => const DetailsScreen(),
        binding: DetailsBinding()),

  ];
}
