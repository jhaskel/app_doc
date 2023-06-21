import 'dart:io';
import 'package:app_doc/src/auth/service/user_service.dart';
import 'package:app_doc/src/utils/response_api.dart';
import 'package:app_doc/src/routes/app_routes.dart';
import 'package:app_doc/src/user/model/user.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';


class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isObscure = true.obs;
  UserService usersService= UserService();

  isObscureActive() {
    isObscure.value = !isObscure.value;
  }

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String password = passwordController.text.trim();


      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Registrando dados....');
      User user = User(
        email: email,
        name: name,
        password: password,
      );
      Response response = await usersService.create(user);
      ResponseApi responseApi = ResponseApi.fromJson(response.body);

      if(responseApi.success==true){
        progressDialog.close();
        GetStorage().write('user', responseApi.data);//armazena os dados
        goToHomePage();

      }else{
        progressDialog.close();
        Get.snackbar('Registro não realizado', responseApi.message?? '');
      }
  }

  void goToLoginPage(GlobalKey<FormState> formKey){
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    formKey.currentState?.reset();
    isObscure.value = true;
    Get.toNamed(Routes.INITIAL);
  }

  void goToHomePage(){
    Get.offNamedUntil(Routes.INITIAL, (route) => false);
  }

  String? validarNome(value){
    if (value == null || value.isEmpty) {
      return 'Digite seu nome';
    }
    return null;
  }

  String? validarEmail(value){
    if (value == null || value.isEmpty) {
      return 'Digite seu email';
    } else if (value.length < 4) {
      return 'email precisa ter  4 characterses';
    } else if (!GetUtils.isEmail(value)) {
      return 'Email não é valido';
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



  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }




}