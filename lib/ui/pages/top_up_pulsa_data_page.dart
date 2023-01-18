import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:bank_sha/ui/widget/top_up_package_item.dart';
import 'package:bank_sha/ui/widget/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widget/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TopUpPulsaDataPage extends StatefulWidget {
  const TopUpPulsaDataPage({Key? key}) : super(key: key);

  @override
  State<TopUpPulsaDataPage> createState() => _TopUpPulsaDataPageState();
}

class _TopUpPulsaDataPageState extends State<TopUpPulsaDataPage> {
  final TextEditingController searchController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paket Data"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          componentHeader(),
          componentPackage(),
        ],
      ),
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
            title: "+628",
            isShowTitle: false,
            controller: searchController,
          ),
        ],
      ),
    );
  }

  //Component Package
  Widget componentPackage() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Package",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 30,
            runSpacing: 17,
            children: [
              TopUpPackageItem(
                packageName: "10GB",
                packagePrice: formatCurrency(218000),
              ),
              TopUpPackageItem(
                packageName: "25GB",
                packagePrice: formatCurrency(420000),
              ),
              TopUpPackageItem(
                packageName: "40GB",
                packagePrice: formatCurrency(2500000),
                isSelected: true,
              ),
              TopUpPackageItem(
                packageName: "99GB",
                packagePrice: formatCurrency(500000000),
              ),
            ],
          ),
          const SizedBox(
            height: 74,
          ),
          CustomFilledButton(
            title: "Continue",
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamed(context, '/topup-data-success');
              }
            },
          )
        ],
      ),
    );
  }
}
