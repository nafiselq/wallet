import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeLastTransactionItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String date;
  final String transaction;
  const HomeLastTransactionItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.date,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(iconUrl),
                fit: BoxFit.cover,
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
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  date,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
