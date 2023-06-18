import 'package:app_doc/src/auth/controller/register_controller.dart';
import 'package:app_doc/src/utils/constants/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'login_view.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final _formKey = GlobalKey<FormState>();
  RegisterController con = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildLargeScreen(size, con, theme);
              } else {
                return _buildSmallScreen(size, con, theme);
              }
            },
          )),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
      Size size,  con, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 3,
            child: Lottie.asset(
              'assets/img/food.json',
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(size, con, theme),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
      Size size,  con, ThemeData theme) {
    return Center(
      child: _buildMainBody(size, con, theme),
    );
  }

  /// Main Body
  Widget _buildMainBody(
      Size size,  RegisterController con, ThemeData theme) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          size.width > 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        size.width > 600
            ? Container()
            : Lottie.asset(
                'assets/img/wave.json',
                height: size.height * 0.2,
                width: size.width,
                fit: BoxFit.fill,
              ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Criar uma Conta',
            style: kLoginTitleStyle(size),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Registrar',
            style: kLoginSubtitleStyle(size),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// username
                TextFormField(

                  style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),


                  controller: con.nameController,
                  validator: con.validarNome
                  // The validator receives the text that the user has entered.

                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// Gmail
                TextFormField(
                  style: kTextFormFieldStyle(),
                  controller: con.emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    hintText: 'email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: con.validarEmail
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// password
                Obx(
                  () => TextFormField(
                    style: kTextFormFieldStyle(),
                    controller: con.passwordController,
                    obscureText: con.isObscure.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open),
                      suffixIcon: IconButton(
                        icon: Icon(
                          con.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          con.isObscureActive();
                        },
                      ),
                      hintText: 'Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: con.validarPassword
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'Criar uma conta significa que \'você concorda com nossos Termos de Serviço e nossa Política de Privacidade',
                  style: kLoginTermsAndPrivacyStyle(size),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// SignUp Button
                signUpButton(theme),
                SizedBox(
                  height: size.height * 0.03,
                ),

                /// Navigate To Login Screen
                GestureDetector(
                  onTap: () {
                  con.goToLoginPage(_formKey);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Já tem uma conta ok?',
                      style: kHaveAnAccountStyle(size),
                      children: [
                        TextSpan(
                            text: " Login",
                            style: kLoginOrSignUpTextStyle(size)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }



  // SignUp Button
  Widget signUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {

          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            con.register(context);
          }
        },
        child: const Text('Registrar'),
      ),
    );
  }
}
