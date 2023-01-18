import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TopUpBankItem extends StatelessWidget {
  final PaymentMethodModel paymentMethodModel;
  final bool? isSelected;
  const TopUpBankItem({
    Key? key,
    required this.paymentMethodModel,
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
            'assets/im_bank_bca.png',
            width: 96,
            height: 30,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethodModel.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                paymentMethodModel.time.toString(),
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
