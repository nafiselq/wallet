import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({Key? key}) : super(key: key);

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  void addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  void deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);

        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        children: [
          const SizedBox(
            height: 36,
          ),
          Center(
            child: Text(
              "Total Amount",
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 67,
          ),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: amountController,
                enabled: false,
                cursorColor: greyColor,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  prefix: Text(
                    "Rp",
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 86,
          ),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              CustomInputPINButton(
                title: "1",
                onTap: () {
                  addAmount("1");
                },
              ),
              CustomInputPINButton(
                title: "2",
                onTap: () {
                  addAmount("2");
                },
              ),
              CustomInputPINButton(
                title: "3",
                onTap: () {
                  addAmount("3");
                },
              ),
              CustomInputPINButton(
                title: "4",
                onTap: () {
                  addAmount("4");
                },
              ),
              CustomInputPINButton(
                title: "5",
                onTap: () {
                  addAmount("5");
                },
              ),
              CustomInputPINButton(
                title: "6",
                onTap: () {
                  addAmount("6");
                },
              ),
              CustomInputPINButton(
                title: "7",
                onTap: () {
                  addAmount("7");
                },
              ),
              CustomInputPINButton(
                title: "8",
                onTap: () {
                  addAmount("8");
                },
              ),
              CustomInputPINButton(
                title: "9",
                onTap: () {
                  addAmount("9");
                },
              ),
              const SizedBox(
                height: 60,
                width: 60,
              ),
              CustomInputPINButton(
                title: "0",
                onTap: () {
                  addAmount("0");
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: numberBackgroundColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFilledButton(
            title: "Checkout Now",
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamed(context, '/transfer-success');
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextButton(
            label: "Terms & Conditions",
            onPressed: () {},
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
