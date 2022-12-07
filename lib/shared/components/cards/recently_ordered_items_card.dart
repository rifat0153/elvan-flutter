import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:elvan/shared/components/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentlyOrderedItemsCard extends StatelessWidget {
  final String foodName;
  final int qty;
  final double price;
  final String imageUrl;

  const RecentlyOrderedItemsCard(
      {super.key,
      required this.foodName,
      required this.qty,
      required this.imageUrl,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: 174,
        height: 82,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UiConstants.cardBorderRadius),
            color: const Color(AppColors.cardColorGrey70).withOpacity(0.7)),
        child: Stack(children: [
          Row(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                  flex: 6,
                  child: SizedBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text(
                              foodName,
                              style: const TextStyle(
                                  color: Color(
                                    AppColors.primaryTextWhite,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .titleMedium!
                              //     .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              'X$qty',
                              style: const TextStyle(
                                  color: Color(
                                    AppColors.primaryTextWhite,
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Center(
                            child: Text(
                              '\$$price',
                              style: const TextStyle(
                                  color: Color(
                                    AppColors.primaryColor,
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                  ))
            ],
          ),
          Positioned(
            top: -42,
            left: -56,
            child: Container(
              height: 124,
              width: 124,
              color: Colors.transparent,
              child: Image(image: AssetImage(imageUrl)),
            ),
          ),
        ]),
      ),
    );
  }
}
