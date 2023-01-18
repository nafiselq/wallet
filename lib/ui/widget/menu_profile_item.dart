import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class MenuProfileItem extends StatelessWidget {
  final String iconUrl;
  final String labelMenu;
  final VoidCallback? onPressed;
  const MenuProfileItem({
    Key? key,
    required this.iconUrl,
    required this.labelMenu,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(children: [
          Image.asset(
            iconUrl,
            width: 24,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(
            labelMenu,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ]),
      ),
    );
  }
}
