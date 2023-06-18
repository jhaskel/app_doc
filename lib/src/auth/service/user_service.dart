import 'dart:convert';
import 'dart:io';

import 'package:app_doc/src/response_api.dart';
import 'package:app_doc/src/user/model/user.dart';
import 'package:app_doc/src/utils/constants/environment/environment.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


class UserService extends GetConnect {

  String url = Environment.API_URL + '/auth';

  User userSession = User.fromJson(GetStorage().read('user') ?? {});


  Future<List<User>> getAll() async {
    Response response = await get(
        '$url/getAll',
        headers: {
          //   'Content-Type': 'application/json',
          //     'Authorization': userSession.sessionToken ?? ''
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA
    if (response.statusCode == 401) {
      Get.snackbar('Peticion denegada', 'Tu usuario no tiene permitido leer esta informacion');
      return [];
    }
    if (response.statusCode == 404) {
      return [];
    }
    List<User> ordens = User.fromJsonList(response.body);
    return ordens;
  }

  Future<Response> create(User user) async {

    Response response = await post(
        '$url/register',
        user.toJsonRegister(),
        headers: {
     //     'Content-Type': 'application/json'
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA
print("register $url/register");
    return response;
  }



  Future<Response> createInterno(User user) async {
    Response response = await post(
        '$url/interno',
        user.toJson(),
        headers: {
          //     'Content-Type': 'application/json'
        }
    ); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    return response;
  }


  Future<ResponseApi> login(String login, String password) async {
    print("login $login");
    print("pass $password");

    Response response = await post(
        '$url/login',
        {
          'email': login,
          'password': password
        },
        headers: {
      //    'Content-Type': 'application/json'
        }
    );
    // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA
print("url $url/login");
    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      print("01");
      return ResponseApi();
    }
print("02");
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

}