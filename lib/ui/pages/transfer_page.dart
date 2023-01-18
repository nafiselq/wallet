import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:bank_sha/ui/widget/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widget/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController searchController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          componentHeader(),
          // componentRecentUser(),
          componentResultUser(),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: "Continue",
          onPressed: () {
            Navigator.pushNamed(context, '/transfer-amount');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //component header
  Widget componentHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: "by username",
            isShowTitle: false,
            controller: searchController,
          ),
        ],
      ),
    );
  }

  //Component RececntUSER
  Widget componentRecentUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imgUrl: "assets/img_friend1.png",
            name: "Yonna Jie",
            userName: "yoenna",
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imgUrl: "assets/img_friend2.png",
            name: "John Hi",
            userName: "jhi",
          ),
          const TransferRecentUserItem(
            imgUrl: "assets/img_friend3.png",
            name: "Masayoshi",
            userName: "form",
          ),
        ],
      ),
    );
  }

  //Component Result User
  Widget componentResultUser() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              TransferResultUserItem(
                imgUrl: "assets/img_friend1.png",
                name: "Yonna Jie",
                username: "yoenna",
              ),
              TransferResultUserItem(
                imgUrl: "assets/img_friend2.png",
                name: "Yonna Ka",
                username: "yoenyu",
                isSelected: true,
              ),
              TransferResultUserItem(
                imgUrl: "assets/img_friend2.png",
                name: "Yonna Ka",
                username: "yoenyu",
              ),
              TransferResultUserItem(
                imgUrl: "assets/img_friend2.png",
                name: "Yonna Ka",
                username: "yoenyu",
              ),
            ],
          ),
          const SizedBox(
            height: 74,
          ),
        ],
      ),
    );
  }
}
