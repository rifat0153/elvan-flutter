import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan_shared/dtos/category/category/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
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
  }

  List<Category>? get selectedCategories {
    final selectedCategories = state.value?.where((e) => e.isSelected).toList();

    if (selectedCategories == null || selectedCategories.isEmpty) {
      return null;
    }

    return selectedCategories;
  }

  List<Category>? get allCategories {
    return state.value?.toList();
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

    state = AsyncValue.data(modifiedCategories);
  }
}
