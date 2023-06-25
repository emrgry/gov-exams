// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gov_exams/core/constants/index.dart';
import 'package:gov_exams/core/enums/index.dart';
import 'package:gov_exams/view/home/home_notifier.dart';
import 'package:gov_exams/widgets/buttons/custom_image_button.dart';
import 'package:gov_exams/widgets/drawer/index.dart';
// import 'package:kartal/kartal.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppZoomDrawer(
      controller: ref.read(homeProvider.notifier).zoomController,
      menuWidget: DrawerMenu(
        context: context,
        menuItems: ref.read(homeProvider.notifier).getExam?.menuNames,
      ),
      mainWidget: mainWidget(ref),
    );
  }

  Scaffold mainWidget(WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.homeTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: upperArea(),
            ),
            Expanded(
              flex: 2,
              child: examArea(ref),
            ),
          ],
        ),
      ),
    );
  }

  Container upperArea() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all()),
    );
  }

  Container examArea(WidgetRef ref) {
    final controller = ref.read(homeProvider.notifier).zoomController;
    final examTypes = ref.read(homeProvider.notifier).getExamTypes;
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all()),
      child: GridView.count(
        crossAxisCount: examTypes.length ~/ 3 + 2,
        children: List.generate(
          examTypes.length,
          (index) {
            return CustomImageButton(
              image: IconEnum.test.toImage,
              text: Text(examTypes[index].examName),
              onTap: () {
                setState(() {
                  ref.read(homeProvider.notifier).setCurrentExamType(index);
                  controller.toggle!();
                });
              },
            );
          },
        ),
      ),
    );
  }
}
