import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/top_up_bank_item.dart';
import 'package:bank_sha/ui/widget/top_up_provider_item.dart';
import 'package:flutter/material.dart';

class TopUpDataPage extends StatelessWidget {
  const TopUpDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beli Data"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          componentHeader(),
          componentProvider(context),
        ],
      ),
    );
  }

  //Component Header
  Widget componentHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Wallet",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 55,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/img_bg_card_wallet.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "8008 2208 1996",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Balance: ${formatCurrency(1800000000)}",
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  //Component Bank
  Widget componentProvider(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Provider",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TopUpProviderItem(
            imgUrl: "assets/img_provider_telkomsel.png",
            providerName: "Telkomsel",
            status: "Available",
            isSelected: true,
          ),
          const TopUpProviderItem(
            imgUrl: "assets/img_provider_indosat.png",
            providerName: "Indosat Ooredoo",
            status: "Available",
          ),
          const TopUpProviderItem(
            imgUrl: "assets/img_provider_singtel.png",
            providerName: "Singtel ID",
            status: "Available",
          ),
          const SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: "Continue",
            onPressed: () {
              Navigator.pushNamed(context, '/topup-pulsa-data');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
