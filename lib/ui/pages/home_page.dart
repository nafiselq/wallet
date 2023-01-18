import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/home_contact_profile_item.dart';
import 'package:bank_sha/ui/widget/home_last_transaction_item.dart';
import 'package:bank_sha/ui/widget/home_service_item.dart';
import 'package:bank_sha/ui/widget/home_tips_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              blueTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_menu_overview.png",
                width: 20,
                color: blueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_menu_history.png",
                width: 20,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_menu_statistic.png",
                width: 20,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_menu_reward.png",
                width: 20,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          "assets/ic_plus_circle.png",
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            componentProfile(context),
            componentCard(),
            componentLevel(),
            componentServices(context),
            componentLastService(),
            componentContactProfile(),
            componentFriendlyTips(),
          ],
        ),
      ),
    );
  }

  //Component Header Profile
  Widget componentProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Howdy,",
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profilePicture == null
                            ? const AssetImage(
                                "assets/img_profile.png",
                              )
                            : NetworkImage(state.user.profilePicture!)
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: state.user.verified == 1
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: greenColor,
                                  size: 14,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  //Component BG Card
  Widget componentCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/img_bg_card.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "**** **** **** ${state.user.cardNumber?.substring(12, 16)}",
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  "Balance",
                  style: whiteTextStyle,
                ),
                Text(
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  //Component Level
  Widget componentLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Level 1",
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                "55% ",
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                "of ${formatCurrency(20000)}",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
            ),
          ),
        ],
      ),
    );
  }

  //Component Services
  Widget componentServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do Something",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: "assets/ic_topup.png",
                title: "Top Up",
                onPressed: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                iconUrl: "assets/ic_send.png",
                title: "Send",
                onPressed: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                iconUrl: "assets/ic_withdraw.png",
                title: "Withdraw",
                onPressed: () {},
              ),
              HomeServiceItem(
                iconUrl: "assets/ic_more.png",
                title: "More",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const MoreDialog(),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  //Component Last Services
  Widget componentLastService() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Transactions",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 22, top: 22, right: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                HomeLastTransactionItem(
                  iconUrl: "assets/ic_transactions_topup.png",
                  title: "Top Up",
                  date: "Yesterday",
                  transaction: "+ ${formatCurrency(450000, symbol: '')}",
                ),
                HomeLastTransactionItem(
                  iconUrl: "assets/ic_transactions_cashback.png",
                  title: "Cashback",
                  date: "Sep 11",
                  transaction: "+ ${formatCurrency(22000, symbol: '')}",
                ),
                HomeLastTransactionItem(
                  iconUrl: "assets/ic_transactions_withdraw.png",
                  title: "Withdraw",
                  date: "Sep 2",
                  transaction: "- ${formatCurrency(5000, symbol: '')}",
                ),
                HomeLastTransactionItem(
                  iconUrl: "assets/ic_transactions_transfer.png",
                  title: "Transfer",
                  date: "Aug 27",
                  transaction: "- ${formatCurrency(123500, symbol: '')}",
                ),
                HomeLastTransactionItem(
                  iconUrl: "assets/ic_transactions_electric.png",
                  title: "Electric",
                  date: "Feb 18",
                  transaction: "- ${formatCurrency(12300000, symbol: '')}",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //Component Contanct Profile
  Widget componentContactProfile() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send Again",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                HomeContactProfileItem(
                  imgUrl: "assets/img_friend1.png",
                  name: "yuanita",
                ),
                HomeContactProfileItem(
                  imgUrl: "assets/img_friend2.png",
                  name: "jani",
                ),
                HomeContactProfileItem(
                  imgUrl: "assets/img_friend3.png",
                  name: "urip",
                ),
                HomeContactProfileItem(
                  imgUrl: "assets/img_friend4.png",
                  name: "masa",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //Component Friendly Tips
  Widget componentFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Friendly Tips",
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 30,
            runSpacing: 18,
            children: const [
              HomeTipsItem(
                imgUrl: "assets/img_tips1.png",
                title: "Best tips for using a credit card",
                url: 'https://www.google.co.id/',
              ),
              HomeTipsItem(
                imgUrl: "assets/img_tips2.png",
                title: "Spot the good pie of finance model",
                url: 'https://www.google.co.id/',
              ),
              HomeTipsItem(
                imgUrl: "assets/img_tips3.png",
                title: "Great hack to get better advices",
                url: 'https://www.google.co.id/',
              ),
              HomeTipsItem(
                imgUrl: "assets/img_tips4.png",
                title: "Save more penny buy this instead",
                url: 'https://www.google.co.id/',
              ),
            ],
          )
        ],
      ),
    );
  }
}

//class Modal
class MoreDialog extends StatelessWidget {
  const MoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 336,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Do More With Us",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 40,
              runSpacing: 29,
              children: [
                HomeServiceItem(
                  iconUrl: "assets/ic_data.png",
                  title: "Data",
                  onPressed: () {
                    Navigator.pushNamed(context, '/topup-data');
                  },
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_water.png",
                  title: "Water",
                  onPressed: () {},
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_stream.png",
                  title: "Stream",
                  onPressed: () {},
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_movie.png",
                  title: "Movie",
                  onPressed: () {},
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_food.png",
                  title: "Food",
                  onPressed: () {},
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_travel.png",
                  title: "Travel",
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
