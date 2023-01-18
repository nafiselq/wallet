import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/buttons.dart';
import '../widget/forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final TextEditingController oldPinController =
      TextEditingController(text: '');
  final TextEditingController newPinController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit PIN"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/profile-edit-success',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CustomFormField(
                      title: "Old PIN",
                      controller: oldPinController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomFormField(
                      title: "New PIN",
                      controller: newPinController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: "Update Now",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdatePin(
                                oldPinController.text,
                                newPinController.text,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
