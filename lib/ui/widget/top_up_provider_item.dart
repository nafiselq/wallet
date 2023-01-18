import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TopUpProviderItem extends StatelessWidget {
  final String imgUrl;
  final String providerName;
  final String status;
  final bool? isSelected;
  const TopUpProviderItem({
    Key? key,
    required this.imgUrl,
    required this.providerName,
    required this.status,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected == true ? blueColor : whiteColor,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imgUrl,
            width: 96,
            height: 30,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                providerName,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                status,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          )
        ],
      ),
    );
  }
}
