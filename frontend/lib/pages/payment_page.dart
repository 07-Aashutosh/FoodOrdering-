import "package:flutter/material.dart";
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:frontend/components/button.dart';
import 'package:frontend/pages/orders_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: const Text("Confirm Payment"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        Text("CVV : $cvvCode"),
                        Text("Card number:$cardNumber"),
                        Text("Expiry Date : $expiryDate"),
                        Text("Card Holder name:$cardHolderName"),
                      ],
                    ),
                  ),
                  actions: [
                    //cancel Button
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel")),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Order_Page()),
                      ),
                      child: const Text("Yes"),
                    ),
                  ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Checkout")),
      body: Column(children: [
        //credit card
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {}), //

        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (data) {
            setState(() {
              cardNumber = data.cardNumber;
              cardHolderName = data.cardHolderName;
              expiryDate = data.expiryDate;
              cvvCode = data.cvvCode;
              
            });
          },
          formKey: formKey,
          themeColor: Color.fromARGB(255, 22, 79, 194),
        ),
        const Spacer(),
        MyButton(text: "Pay Now", onTap: userTappedPay),
        const SizedBox(
          height: 10,
        )
      ]),
      
    );
  }
}
