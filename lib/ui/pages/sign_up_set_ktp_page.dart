import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/signup_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/shared_methods.dart';

class SingUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;
  const SingUpSetKtpPage({super.key, required this.data});

  @override
  State<SingUpSetKtpPage> createState() => _SingUpSetKtpPageState();
}

class _SingUpSetKtpPageState extends State<SingUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data.toJson());
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
              Container(
                width: 155,
                height: 50,
                margin: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img_logo_light.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "Verify Your\nAccount",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    //Image
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        setState(() {
                          selectedImage = image;
                        });
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightBackgroundColor,
                          image: selectedImage == null
                              ? null
                              : DecorationImage(
                                  image: FileImage(
                                    File(selectedImage!.path),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Image.asset(
                                  "assets/ic_upload.png",
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Passport/ID Card",
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () {
                        if (validate()) {
                          print(widget.data);
                          context.read<AuthBloc>().add(
                                AuthRegister(
                                  widget.data.copyWith(
                                    ktp: selectedImage == null
                                        ? null
                                        : 'data:image/png;base64,' +
                                            base64Encode(
                                              File(selectedImage!.path)
                                                  .readAsBytesSync(),
                                            ),
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(
                              context, "Passport/ID card harus diupload!");
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextButton(
                label: "Skip for Now",
                onPressed: () {
                  print(widget.data);
                  context.read<AuthBloc>().add(AuthRegister(widget.data));
                },
              ),
              const SizedBox(
                height: 81,
              ),
            ],
          );
        },
      ),
    );
  }
}
