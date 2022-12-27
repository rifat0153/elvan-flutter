import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:collection/collection.dart';

import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/features/category/domain/use_cases/category_usecase.dart';

part 'category_notifier.g.dart';

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  FutureOr<List<Category>> build() {
    final useCase = ref.read(categoryUseCaseProvider);

    return useCase.getCategories();
  }

  List<Category>? get categoriesSortedBySelected {
    return state.valueOrNull;
    return state.valueOrNull?.toList()
      ?..sort(
        (a, b) {
          if (a.isSelected && !b.isSelected) {
            return -1;
          } else if (!a.isSelected && b.isSelected) {
            return 1;
          } else {
            return 0;
          }
        },
      );
  }

  List<Category>? get selectedCategories {
    return state.value?.where((e) => e.isSelected).toList();
  }

  List<Category>? get notSelectedCategories {
    return state.value?.where((e) => !e.isSelected).toList();
  }

  void resetSelectedAndNew(Category category) {
    final modifiedCategories = state.value?.map((e) {
      if (e.id == category.id) {
        return e.copyWith(isSelected: true);
      }
      return e.copyWith(isSelected: false);
    }).toList();

    if (modifiedCategories != null) {
      state = AsyncValue.data(modifiedCategories);
    }
  }

  void toggleSelectState(Category category) {
    final categories = state.value ?? [];

    final isCategorySelected = categories
            .firstWhereOrNull(
              (e) => e == category,
            )
            ?.isSelected ??
        false;

    // remove the category from the list and add it to the first unselected index
    final modifiedCategories = categories
        .where(
          (e) => e.id != category.id,
        )
        .toList();

    final indexToInsert = !isCategorySelected
        ? 0
        : modifiedCategories.indexWhere(
            (e) => !e.isSelected,
          );

    // insert into the first unselected index
    if (indexToInsert > -1) {
      modifiedCategories.insert(
        indexToInsert,
        category.copyWith(isSelected: !isCategorySelected),
      );
    } else {
      modifiedCategories.add(category.copyWith(isSelected: !isCategorySelected));
    }

    logError('Selected Titles: ${modifiedCategories.where((e) => e.isSelected).map((e) => e.title).toList()} ');

    if (modifiedCategories != null) {
      state = AsyncValue.data(modifiedCategories);
    }
  }
  // void toggleSelectState(Category category) {
  //   final modifiedCategories = state.value?.map((e) {
  //     if (e.id == category.id) {
  //       return e.copyWith(isSelected: !e.isSelected);
  //     }
  //     return e;
  //   }).toList();

  //   final indexOfFirstUnselected = modifiedCategories?.indexWhere((e) => !e.isSelected);

  //   // insert into the first unselected index
  //   if (indexOfFirstUnselected != null && indexOfFirstUnselected > -1) {
  //     modifiedCategories?.insert(indexOfFirstUnselected, category.copyWith(isSelected: true));
  //   } else {
  //     modifiedCategories?.add(category.copyWith(isSelected: true));
  //   }

  //   logError('Selected Titles: ${modifiedCategories?.where((e) => e.isSelected).map((e) => e.title).toList()} ');

  //   if (modifiedCategories != null) {
  //     state = AsyncValue.data(modifiedCategories);
  //   }
  // }
}
