import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 123,
      width: 102,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(AppColors.primaryColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Image(
            height: 58,
            width: 58,
            image: AssetImage(
              '${Strings.assetImages}pizza_slice.png',
            ),
          )),
          SizedBox(
            height: 15.5,
          ),
          Text(
            'Pizza',
            style: TextStyle(
                color: Color(
                  AppColors.primaryTextWhite,
                ),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
