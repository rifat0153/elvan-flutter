import 'package:elvan/features/home/components/top_picks_item.dart';
import 'package:elvan/features/home/components/top_picks_section_header.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopPicksSection extends StatelessWidget {
  const TopPicksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 300,
      width: double.infinity,

      child: Column(
        children: [
          const TopPicksSectionHeader(),
          const SizedBox(height: 20),
          //   TopPicksItem()
          GridView.count(
            physics: const ScrollPhysics(),
            childAspectRatio: 0.90,
            mainAxisSpacing: 27,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: const [
              TopPicksItem(),
              TopPicksItem(),
              TopPicksItem(),
              TopPicksItem(),
              TopPicksItem(),
            ],
          ),

          //   const SizedBox(height: 50),
        ],
      ),
    );
  }
}
