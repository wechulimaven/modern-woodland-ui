import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool isCvvFocused;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardHolderName: cardHolderName,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              expiryDate: expiryDate,
              showBackView: isCvvFocused,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onModalChange,
                ),
              ),
            ),
            OutlineButton(
              child: Text('Proceed'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }

  void onModalChange(CreditCardModel model) {
    setState(() {
      cardHolderName = model.cardHolderName;
      cardNumber = model.cardNumber;
      cvvCode = model.cvvCode;
      expiryDate = model.expiryDate;
      isCvvFocused = model.isCvvFocused;
    });
  }
}
