import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/menu_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "My Profile",
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
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

          if (state is AuthSuccess) {
            print(state.user.profilePicture);
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: state.user.profilePicture == null
                                ? const AssetImage(
                                    "assets/img_profile.png",
                                  )
                                : NetworkImage(
                                    state.user.profilePicture!,
                                  ) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: state.user.verified == 1
                            ? Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: greenColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        state.user.name.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      MenuProfileItem(
                        iconUrl: "assets/ic_profile.png",
                        labelMenu: "Edit Profile",
                        onPressed: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit');
                          }
                        },
                      ),
                      MenuProfileItem(
                        iconUrl: "assets/ic_shield.png",
                        labelMenu: "My PIN",
                        onPressed: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit-pin');
                          }
                        },
                      ),
                      const MenuProfileItem(
                        iconUrl: "assets/ic_wallet.png",
                        labelMenu: "Wallet Settings",
                      ),
                      const MenuProfileItem(
                        iconUrl: "assets/ic_reward.png",
                        labelMenu: "My Rewards",
                      ),
                      const MenuProfileItem(
                        iconUrl: "assets/ic_help.png",
                        labelMenu: "Help Center",
                      ),
                      MenuProfileItem(
                        iconUrl: "assets/ic_logout.png",
                        labelMenu: "Log Out",
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 87,
                ),
                CustomTextButton(
                  label: "Report a Problem",
                  onPressed: () {},
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
