import 'package:app_doc/src/routes/app_routes.dart';
import 'package:app_doc/src/user/model/user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';


User userSession = User.fromJson(GetStorage().read('user')?? {});

void main() async {
  await GetStorage.init();
  runApp(App());
  setUrlStrategy(PathUrlStrategy());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MyMaterialApp();
  }
}

class MyMaterialApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      locale: Locale('pt', 'BR'), // translations will be displayed in that locale
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
      title: 'App Doc',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id == null
          ? '/login'
          : '/',

      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: const ColorScheme(
            primary: Colors.amber,
            secondary: Colors.amberAccent,
            onPrimary: Colors.white70,
            surface: Colors.red,
            error: Colors.redAccent,
            onSurface: Colors.blue,
            background: Colors.white,
            onSecondary: Colors.grey,
            onError: Colors.redAccent,
            brightness: Brightness.light,
            onBackground: Colors.green,
          )),
      getPages: AppRoutes.pages,
      navigatorKey: Get.key,
    );


  }


}
