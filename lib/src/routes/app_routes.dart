

import 'package:app_doc/src/auth/view/login_view.dart';
import 'package:app_doc/src/auth/view/signUp_view.dart';
import 'package:app_doc/src/home/view/home_main.dart';
import 'package:app_doc/src/home/view/home_page.dart';
import 'package:app_doc/src/user/model/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


abstract class Routes {


  static const INITIAL = "/";
  static const REGISTER = "/register";
  static const LOGIN = "/login";


  static const FORGET = "/forget";
  static const RESET = "/reset";
  static const OPERADOR = "/operador";

  static const NOTFOUND = "/notFound";
}

class AppRoutes {
  User userSession = User.fromJson(GetStorage().read('user')?? {});

  static final pages = [

    GetPage(
        name: Routes.INITIAL,
        page: () => HomeMain(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 600)
    ),


   GetPage(
        name: Routes.LOGIN,
        page: () => LoginView(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 600)
   ),

    GetPage(
        name: Routes.REGISTER,
        page: () => SignUpView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 600)
    ),





  ];
}
