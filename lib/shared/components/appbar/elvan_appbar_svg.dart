import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElvanAppBarSvg extends StatelessWidget {
  const ElvanAppBarSvg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: kToolbarHeight,
      color: AppColors.primaryRed,
      child: Center(
        child: SvgPicture.asset(
          AppAsset.logoSvg,
          height: 20,
          width: 103,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
