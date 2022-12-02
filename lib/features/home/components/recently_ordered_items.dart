import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentlyOrderedItems extends StatelessWidget {
  const RecentlyOrderedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: 174,
        height: 82,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
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
                        children: const [
                          Center(
                            child: Text(
                              'Pizza',
                              style: TextStyle(
                                  color: Color(
                                    AppColors.primaryTextWhite,
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Center(
                            child: Text(
                              'X2',
                              style: TextStyle(
                                  color: Color(
                                    AppColors.primaryTextWhite,
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Center(
                            child: Text(
                              '\$199',
                              style: TextStyle(
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
              child: const Image(
                  image: AssetImage('${Strings.assetImages}pizza.png')),
            ),
          ),
        ]),
      ),
    );
  }
}
