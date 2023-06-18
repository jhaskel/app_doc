
import 'dart:async';



import 'package:app_doc/src/auth/service/user_service.dart';
import 'package:app_doc/src/response_api.dart';
import 'package:app_doc/src/routes/app_routes.dart';
import 'package:app_doc/src/user/model/user.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class AuthController extends GetxController {
  // login with email and password
  bool isloadingSignIn = false;
  String errorMessage = "";



  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isObscure = true.obs;
  User myUser = User.fromJson(GetStorage().read('user') ?? {});

  UserService usersProvider = UserService();
  isObscureActive() {
    isObscure.value = !isObscure.value;
  }



  void goToRegisterPage(GlobalKey<FormState> formKey){
    loginController.clear();
    passwordController.clear();
    formKey.currentState?.reset();
    isObscure.value = true;
    Get.toNamed(Routes.REGISTER);
  }






  void signIn(BuildContext context) async {
    String email = loginController.text.trim();
    String senha = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, senha);
    isloadingSignIn = true;
    try {
      if (responseApi.success == true) {
        print(responseApi.data);

        GetStorage().write('user', responseApi.data); // DATOS DEL USUARIO EN SESION
        User myUser = await User.fromJson(GetStorage().read('user') ?? {});


        isloadingSignIn = false;
        update();

        if (myUser.role ==2 ) {
          goToHome();

        }
        else { // SOLO UN ROL
          GetStorage().write('role', myUser.name); // DATOS DEL USUARIO EN SESION
          //goToHomePage();
        }
      }
      else {
        Get.snackbar('Login não realizado!', responseApi.message ?? '');
      }

    } catch (e) {
      isloadingSignIn = false;
      errorMessage = e.toString();
      update();
    }

  }

  void goToHome() {
    Get.offNamedUntil('/', (route) => false);
  }

  bool showpassword = false;
  onchangepasswordvisibility() {
    showpassword = !showpassword;

    update();
  }

  Future SignOut() async {
  //  currentuserModel = null;
    GetStorage().erase();
    Get.offNamedUntil('/login', (route) => false);

    update();
  }

  String? validarNome(value){
    if (value == null || value.isEmpty) {
      return 'Digite seu nome';
    } else if (value.length < 4) {
      return 'nome precisa ter  4 characterses';
    } else if (value.length > 10) {
      return 'maximum characteres é 10';
    }
    return null;
  }
  String? validarLogin(value){
    if (value == null || value.isEmpty) {
      return 'Digite seu numero de telefone';
    }
    return null;
  }
  String? validarPassword(value){
    if (value == null || value.isEmpty) {
      return 'Digite sua senha';
    } else if (value.length < 4) {
      return 'senha precisa ter  4 characterses';
    } else if (value.length > 10) {
      return 'maximum characteres é 10';
    }
    return null;
  }


}


