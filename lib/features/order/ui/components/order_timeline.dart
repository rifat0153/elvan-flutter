import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan_shared/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimeLine extends StatelessWidget {
  const OrderTimeLine({
    this.isLast = false,
    this.isFirst = false,
    required this.title,
    this.isCompleted = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool isLast;
  final bool isFirst;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      afterLineStyle: const LineStyle(color: AppColors.primaryRed),
      beforeLineStyle: const LineStyle(color: AppColors.primaryRed),
      indicatorStyle: IndicatorStyle(
        width: 25,
        color: AppColors.primaryRed,
        indicator: !isCompleted
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      border: Border.all(
                        width: 2,
                        color: AppColors.primaryRed,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryRed,
                    ),
                  )
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  AppAsset.checkboxState,
                  fit: BoxFit.cover,
                ),
              ),
      ),
      alignment: TimelineAlign.manual,
      lineXY: 0.0,
      endChild: Container(
        constraints: const BoxConstraints(
          minHeight: 70,
        ),
        child: Center(
          child: AppText(
            title,
            color: isCompleted ? AppColors.white : Colors.grey,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      // startChild: const AppText(""),
    );
  }
}
