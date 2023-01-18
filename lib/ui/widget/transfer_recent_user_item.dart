import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String userName;
  final bool isVerified;
  const TransferRecentUserItem({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.userName,
    this.isVerified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                '@$userName',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (isVerified)
            Row(
              children: [
                Container(
                  height: 14,
                  width: 14,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/ic_check.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Verified",
                  style: greenTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
