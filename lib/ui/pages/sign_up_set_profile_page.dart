import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/models/signup_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfilePage({
    super.key,
    required this.data,
  });

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final TextEditingController pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
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
      body: ListView(
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
            "Join Us to Unlock\nYour Growth",
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
                  widget.data.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //Password
                CustomFormField(
                  title: "Set PIN(6 digit number)",
                  controller: pinController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: "Continue",
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingUpSetKtpPage(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,' +
                                      base64Encode(
                                        File(selectedImage!.path)
                                            .readAsBytesSync(),
                                      ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackbar(context, 'Pin harus diisi 6 angka!');
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
