
import 'package:app_doc/src/home/controllers/pages_controller.dart';
import 'package:app_doc/src/home/view/home_desktop.dart';
import 'package:app_doc/src/utils/constants/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeMain> {

  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PagesController c = Get.put(PagesController());
   final page= c.page.value;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Resposivo(
          mobile: HomeDesktop(),
          desktop: HomeDesktop(),
          tablet: HomeDesktop(),
        ),
      ),
    );
  }
}




