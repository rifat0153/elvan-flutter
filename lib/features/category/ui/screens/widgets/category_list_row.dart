import 'package:elvan/features/category/ui/screens/widgets/category_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/dtos/category/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategiryListRow extends StatelessWidget {
  const CategiryListRow({super.key, required this.categories});

  final Iterable<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.paddingMD),
        _categoryTitle(context),
        const SizedBox(height: AppSize.paddingMD),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: AppSize.paddingMD),
              for (final category in categories) ...[
                CategoryCard(category: category),
                const SizedBox(
                  width: AppSize.paddingMD,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryTitle(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppSize.paddingMD),
        AppText(
          AppLocalizations.of(context)!.categoriesListTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        AppText(
          AppLocalizations.of(context)!.viewAll,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: AppSize.paddingMD),
      ],
    );
  }
}
