import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/signin_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared_methods.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
        },
        builder: (context, state) {
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
                "Sign In &\nGrow Your Finance",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Note : EMAIL INPUT
                    CustomFormField(
                      title: "Email Address",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // Note : EMAIL INPUT
                    CustomFormField(
                      title: "Password",
                      obscureText: true,
                      controller: passController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password",
                        style: blueTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: "Sign In",
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailController.text,
                                    password: passController.text,
                                  ),
                                ),
                              );

                          Navigator.pushNamedAndRemoveUntil(
                              context, '/home', (route) => false);
                        } else {
                          showCustomSnackbar(
                              context, 'Semua Field harus diisi');
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //Custom Text BUTTON
              CustomTextButton(
                label: "Create New Account",
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              ),
              const SizedBox(
                height: 46,
              ),
            ],
          );
        },
      ),
    );
  }
}
