import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:indomobil_exhibition_front_end/component/text_field_component.dart';

class LoginScreen extends StatefulWidget {
  final String path;
  const LoginScreen({super.key, required this.path});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formLogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.155,
                    child: Image.network(
                      "https://th.bing.com/th/id/R.4d7ecd77f71ca65ef5f278f6ee98f068?rik=vvjw3oJqDNtFJg&riu=http%3a%2f%2ftous-logos.com%2fwp-content%2fuploads%2f2017%2f08%2fLogo-Citro%c3%abn.png&ehk=miMCrHSX9LZWemcgw8wlpN3g3bqdkJVJYB4mxSwmvrk%3d&risl=&pid=ImgRaw&r=0",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Please insert your email and password",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  customTextField(
                    "Email",
                    emailController,
                    [
                      RequiredValidator(
                          errorText: "Mohon untuk memasukan Email"),
                      EmailValidator(
                          errorText: "Mohon untuk memasukan Email yang benar")
                    ],
                    "test@mail.com",
                  ),
                  customTextField(
                      "Password",
                      passwordController,
                      [
                        RequiredValidator(
                            errorText: "Mohon untuk memasukan Password")
                      ],
                      "Input your password"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: screenWidth,
                      child: ElevatedButton(
                          onPressed: () {
                            _formLogin.currentState!.validate();
                          },
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero))),
                          child: const Text("Login")),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
