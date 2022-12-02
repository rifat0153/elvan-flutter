import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainAppbar extends StatelessWidget with PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(86);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 86,
      title: const Image(
        color: Colors.white,
        height: 29,
        width: 107,
        image: AssetImage(
          '${Strings.assetImages}elvan_logo.png',
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color(AppColors.primaryColor),
    );
  }
}
