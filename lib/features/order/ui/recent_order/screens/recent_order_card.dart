import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';

class RecentOrderCard extends HookConsumerWidget {
  const RecentOrderCard({super.key, required this.order});

  final Order order;

  static final double imageTopOffset = -40.w;
  static final double imageLeftOffset = -60.w;
  static final double imageRadius = 60.w;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseCard(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    top: imageTopOffset,
                    left: imageLeftOffset,
                    child: CircleAvatar(
                      radius: imageRadius,
                      backgroundImage: CachedNetworkImageProvider(
                        order.items.first.foodItemCustomized.foodItem.imageUrl!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(flex: 3, child: AppText('ss'))
          ],
        ),
      ),
    );
  }
}
