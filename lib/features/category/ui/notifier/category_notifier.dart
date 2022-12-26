import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    final modifiedCategories = state.value?.map((e) {
      if (e.id == category.id) {
        return e.copyWith(isSelected: !e.isSelected);
      }
      return e;
    }).toList();

    logError('Selected Titles: ${modifiedCategories?.where((e) => e.isSelected).map((e) => e.title).toList()} ');

    if (modifiedCategories != null) {
      state = AsyncValue.data(modifiedCategories);
    }
  }
}
