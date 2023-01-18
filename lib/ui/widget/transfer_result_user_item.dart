import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String username;
  final bool isSelected;
  const TransferResultUserItem({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.username,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
        ),
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  imgUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: isSelected
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
          const SizedBox(
            height: 13,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "@$username",
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
