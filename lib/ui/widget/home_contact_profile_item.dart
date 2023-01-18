import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class HomeContactProfileItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  const HomeContactProfileItem({
    Key? key,
    required this.imgUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            '@$name',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
