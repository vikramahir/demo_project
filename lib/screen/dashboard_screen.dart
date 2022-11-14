import 'package:demo_project/controller/dashboard_controller.dart';
import 'package:demo_project/model/movie_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _movieList(),
      ),

    );
  }

  Widget _movieList() {
    return ListView.builder(
      itemCount: controller.movieData.entries.length,
      itemBuilder: (context, index) {
        return _movieItem(index);
      },
    ).marginSymmetric(vertical: 5.0, horizontal: 5.0);
  }

  Widget _movieItem(int index) {
    Entries entries = controller.movieData.entries[index];
    return GestureDetector(
      onTap: ()=>{controller.goToDetails(entries)},
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
