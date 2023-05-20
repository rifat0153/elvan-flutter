import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan_shared/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({
    Key? key,
    required this.orderID,
    required this.estimatedTime,
  }) : super(key: key);

  final String orderID;
  final num estimatedTime;

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
                  AppText(
                    AppLocalizations.of(context)!.estimatedTime,
                  ),
                  AppText(
                    "${estimatedTime.toInt()} Min",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    AppLocalizations.of(context)!.yourOrderID,
                  ),
                  AppText(
                    "#$orderID",
                    style: Theme.of(context).textTheme.headlineSmall,
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
