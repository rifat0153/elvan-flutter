import 'package:elvan/features/home/components/category_items.dart';
import 'package:elvan/features/home/components/category_section_header.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 275,
      margin: const EdgeInsets.only(bottom: 52),
      width: double.infinity,
      color: Colors.transparent,
      child: Column(children: [
        const CategorySectionHeader(),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
              Row(children: List.generate(5, (index) => const CategoryItems())),
        )
      ]),
    );
  }
}
