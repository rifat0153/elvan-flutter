import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan_shared/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({
    Key? key,
    required this.orderID,
    required this.estimatedTime,
  }) : super(key: key);

  final String orderID;
  final String estimatedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.primaryRed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppText("Estimated Time"),
                  AppText(
                    "30 Min",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppText("Your Order ID"),
                  AppText(
                    "#$orderID",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
