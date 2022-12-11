import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.radiusSM.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: AppSize.radiusMD.r,
            offset: Offset(0, AppSize.radiusSM.r),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSize.paddingMD),
      child: child,
    );
  }
}
