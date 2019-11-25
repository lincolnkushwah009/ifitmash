import 'package:flutter/material.dart';


class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;

    return new Container(
      color: Colors.black,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
            child: new Image.asset(
              'assets/image/logo.png',
              height: 200.0,
              width: itemWidth,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(
              "IFITMASH",
              style: new TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: new Text(
                  "ifitmash.com ('Website') is an online service operated and managed by IFITMASH SPORTS "
                      "('ifitmash' or 'we' or 'us'). In using "
                      "the ifitmash service, you are deemed to have accepted the terms and "
                      "conditions of the agreement listed below or as may be revised from time to "
                      "time ('User Agreement'), which is, for an indefinite period and you understand and agree "
                      "that you are bound by such terms till the time you access this website. We reserve the"
                      " right to change the terms and conditions of this User Agreement from time to time without any "
                      "obligation to inform you and it is your responsibility to look through them as often as possible.\n We "
                      "strive to provide accurate product and pricing information. In the event that a product is listed "
                      "at an incorrect price or with incorrect information due to an error in pricing or product information, "
                      "we shall have the right, at our sole discretion, to refuse or cancel any orders placed for that product, "
                      "unless the product has already been dispatched. In the event that an item is mispriced, we may,"
                      " at our sole discretion, either contact you for instructions or cancel your order and notify you "
                      "of such cancellation. Unless the product ordered by you has been dispatched, your offer will not "
                      "be deemed accepted and we will have the right to modify the price of the product and contact you "
                      "for further instructions using the e-mail address or the contact number provided by you during the"
                      " time of registration, or cancel the order and notify you of such cancellation. In the event we accept "
                      "your order the same shall be debited to your credit / debit card account and "
                      "duly notified to you by email or the contact number, "
                      "as the case may be, that the payment has been processed. "
                      "The payment may be processed prior to dispatch of the product that you have ordered. "
                      "If we have to cancel the order after we have processed the payment, the said amount will "
                      "be reversed back to your credit / debit card account. We strive to provide you with best value,"
                      " however prices and availability are subject to change without notice.",
                  style: new TextStyle(
                    fontSize: 16.0, color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}