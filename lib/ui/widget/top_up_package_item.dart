import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TopUpPackageItem extends StatelessWidget {
  final String packageName;
  final String packagePrice;
  final bool isSelected;
  const TopUpPackageItem({
    Key? key,
    required this.packageName,
    required this.packagePrice,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 171,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
        ),
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            packageName,
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            packagePrice,
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
