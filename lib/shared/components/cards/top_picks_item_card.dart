import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:elvan/shared/components/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopPicksItemCard extends StatelessWidget {
  final String foodName;
  final double price;
  final String ingredients;
  final String imageUrl;

  const TopPicksItemCard(
      {super.key,
      required this.foodName,
      required this.price,
      required this.ingredients,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Container(
          //  margin: const EdgeInsets.only(bottom: 26),
          clipBehavior: Clip.hardEdge,
          width: 174,
          height: 211,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UiConstants.cardBorderRadius),
            color: const Color(AppColors.cardColorGrey70).withOpacity(0.7),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 55,
                child: Container(
                  color: Colors.transparent,
                  child: Stack(children: [
                    Positioned(
                      top: -72,
                      left: -77,
                      child: Container(
                        height: 182,
                        width: 182,
                        color: Colors.transparent,
                        child: Image(
                            fit: BoxFit.fitWidth, image: AssetImage(imageUrl)),
                      ),
                    ),
                    const Positioned(
                        top: 19,
                        right: 18.32,
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: Color(AppColors.primaryTextWhite),
                        ))
                  ]),
                ),
              ),
              Expanded(
                flex: 45,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  clipBehavior: Clip.none,
                  color: Colors.transparent,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName,
                          style: const TextStyle(
                              color: Color(AppColors.primaryTextWhite),
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        SizedBox(
                            height: 27,
                            width: 130,
                            child: Text(
                              ingredients,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Color(AppColors.primaryTextWhite),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500),
                            )),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$$price',
                              style: const TextStyle(
                                  color: Color(AppColors.primaryColor),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(AppColors.primaryColor)),
                              child: const Icon(
                                Icons.add,
                                color: Color(AppColors.primaryTextWhite),
                                size: 14,
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
