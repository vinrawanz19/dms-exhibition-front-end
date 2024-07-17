import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:indomobil_exhibition_front_end/component/text_field_component.dart';
import 'package:indomobil_exhibition_front_end/cubit/form_cubit/form_cubit.dart';
import 'package:indomobil_exhibition_front_end/models/form_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:html' as html;

class FormScreen extends StatefulWidget {
  final String path;
  const FormScreen({super.key, required this.path});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController namaController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController domisiliController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocProvider(
        create: (context) => FormCubit()..initForm(widget.path),
        child: BlocConsumer<FormCubit, FormCubitState>(
          listener: (context, state) {
            if (state is FormSubmit) {
              Flushbar(
                backgroundColor: Colors.green,
                margin: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
                isDismissible: true,
                duration: const Duration(seconds: 5),
                flushbarPosition: FlushbarPosition.BOTTOM,
                flushbarStyle: FlushbarStyle.FLOATING,
                reverseAnimationCurve: Curves.decelerate,
                forwardAnimationCurve: Curves.elasticOut,
                title: "Success",
                message:
                    "Form telah berhasil disimpan, terima kasih telah mengisi form.",
              ).show(context);
              namaController.clear();
              phoneController.clear();
              emailController.clear();
              domisiliController.clear();
            } else if (state is FormError) {
              Flushbar(
                backgroundColor: Colors.red,
                margin: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(8),
                isDismissible: true,
                duration: const Duration(seconds: 5),
                flushbarPosition: FlushbarPosition.BOTTOM,
                flushbarStyle: FlushbarStyle.FLOATING,
                reverseAnimationCurve: Curves.decelerate,
                forwardAnimationCurve: Curves.elasticOut,
                title: "Success",
                message: "${state.message}, please use another email.",
              ).show(context);
              emailController.clear();
            }
          },
          builder: (context, state) {
            if (state is FormLoading) {
              return Center(
                child: LoadingAnimationWidget.threeRotatingDots(
                    color: Colors.blue, size: 50),
              );
            } else if (state is FormLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3,
                        height: screenHeight * 0.1,
                        child: Image.network(
                          state.content.logoPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                      CustomPaint(
                        size: Size(screenWidth,
                            4), // You can adjust the size as needed
                        painter: LinePainter(),
                      ),
                      Text(
                        "Welcome to ${state.content.name} GIIAS 2024",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Card(
                          shape: const Border.symmetric(
                              horizontal: BorderSide.none,
                              vertical: BorderSide.none),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customTextField(
                                    "Nama Sesuai KTP",
                                    namaController,
                                    [
                                      RequiredValidator(
                                          errorText: "Nama harus diisi")
                                    ],
                                    "Contoh: Adam Albar"),
                                customTextField(
                                    "No Handphone Aktif",
                                    phoneController,
                                    [
                                      RequiredValidator(
                                          errorText:
                                              "No Handphone harus diisi"),
                                      PatternValidator(r'^08',
                                          errorText:
                                              "No Handphone harus dimulai dari 08"),
                                      MinLengthValidator(8,
                                          errorText:
                                              "No Handphone minimal 8 digit"),
                                      MaxLengthValidator(16,
                                          errorText:
                                              "No Handphone maksimal 16 digit"),
                                    ],
                                    "Contoh: 08xxxx"),
                                customTextField(
                                    "Email",
                                    emailController,
                                    [
                                      RequiredValidator(
                                          errorText: "Email harus diisi"),
                                      EmailValidator(
                                          errorText:
                                              "Mohon untuk memasukan Email yang benar"),
                                    ],
                                    "Contoh: mail@gmail.com"),
                                customTextField(
                                    "Domisili",
                                    domisiliController,
                                    [
                                      RequiredValidator(
                                          errorText: "Domisili harus diisi")
                                    ],
                                    "Contoh:Jakarta"),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: SizedBox(
                                    width: screenWidth,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero))),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .read<FormCubit>()
                                              .insertForm(FormModel(
                                                id: null,
                                                name: namaController.text,
                                                email: emailController.text,
                                                phoneNumber:
                                                    phoneController.text,
                                                domisili:
                                                    domisiliController.text,
                                                company: widget.path,
                                              ));
                                        }
                                      },
                                      child: const Text("Submit"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else if (state is FormError) {
              return Center(
                child: SizedBox(
                  height: screenHeight * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                "${state.message}. Please press the refresh button."),
                            ElevatedButton(
                                onPressed: () {
                                  html.window.location.reload();
                                },
                                child: const Text("Refresh"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: Text("Unknown Error"),
              );
            }
          },
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1;

    final startPoint = Offset(0, size.height / 5);
    final endPoint = Offset(size.width, size.height / 5);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
