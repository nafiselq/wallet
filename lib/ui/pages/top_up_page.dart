import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/top_up_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/top_up_amount_page.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/top_up_bank_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/payment_method_model.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  PaymentMethodModel? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          componentHeader(),
          componentBank(context),
        ],
      ),
      floatingActionButton: (selectedPaymentMethod != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TopUpAmountPage(
                        topUpFormModel: TopUpFormModel(
                          paymentMethodCode: selectedPaymentMethod?.code,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Container(
                      height: 55,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
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
                            state.user.cardNumber!.replaceAllMapped(
                                RegExp(r".{4}"),
                                (match) => "${match.group(0)} "),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            state.user.name.toString(),
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }

  //Component Bank
  Widget componentBank(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Bank",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children: state.paymentMethods.map((paymentMethod) {
                      print(paymentMethod.name);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPaymentMethod = paymentMethod;
                          });
                        },
                        child: TopUpBankItem(
                          paymentMethodModel: paymentMethod,
                          isSelected:
                              paymentMethod.id == selectedPaymentMethod?.id,
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
