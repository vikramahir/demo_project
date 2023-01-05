import 'package:demo_project/controller/dashboard_controller.dart';
import 'package:demo_project/model/movie_data.dart';
import 'package:demo_project/utils/adaptive/adaptive_base_widget.dart';
import 'package:demo_project/utils/adaptive/adaptive_widgets/adaptive_grid.dart';
import 'package:demo_project/utils/appbars/glorifi_appbar.dart';
import 'package:demo_project/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: Text(
                'Dashboard',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
      bottomNavigationBar: Constant.bottomNavigationBar,
      body: AdaptiveBuilder(builder: (context, sizeInfo) {
        if (sizeInfo.isTablet) {
          return Column(
            children: [
              Visibility(
                visible: kIsWeb && sizeInfo.screenSize.width > 600,
                child: WebAppBar(sizingInformation: sizeInfo),
              ),
              Visibility(
                visible: kIsWeb,
                child: WebHeader(sizingInformation: sizeInfo),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(20.r),
                  alignment: Alignment.center,
                  child: const Text(
                    'isTablet',
                  ),
                ),
              ),
            ],
          );
        } else if (sizeInfo.isDesktop) {
          return Column(
            children: [
              WebAppBar(sizingInformation: sizeInfo),
              WebHeader(sizingInformation: sizeInfo),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.all(20.r),
                  alignment: Alignment.center,
                  child: const Text(
                    'isDesktop',
                  ),
                ),
              ),
            ],
          );
        } else {
          return Obx(
            () => controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _movieList(),
          );
        }
      }),
    );
  }

  Widget _movieList() {
    return AdaptiveGrid(
      gridSpacing: 25,
      children: _movieItem1(),
    );
    return ListView.builder(
      itemCount: controller.movieData.entries.length,
      itemBuilder: (context, index) {
        return _movieItem(index);
      },
    ).marginSymmetric(vertical: 5.0, horizontal: 5.0);
  }

  List<AdaptiveGridItem> _movieItem1() {
    return controller.movieData.entries
        .map((entries) => AdaptiveGridItem(
              child: GestureDetector(
                onTap: () => {controller.goToDetails(entries)},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category : ${entries.Category}',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Description : ${entries.Description}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();
  }

  Widget _movieItem(int index) {
    Entries entries = controller.movieData.entries[index];
    return GestureDetector(
      onTap: () => {controller.goToDetails(entries)},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 75,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Category : ${entries.Category}'),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text('Description : ${entries.Description}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
