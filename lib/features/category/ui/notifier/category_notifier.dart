import 'package:elvan/core/ui_state/ui_state.dart';
import 'package:elvan/features/category/domain/category_usecase.dart';
import 'package:elvan/features/food/models/category/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CategoryNotifier extends Notifier<UiState<List<Category>>> {
  late final CategoryUseCase categoryUseCase;

  List<Category>? get categories => state.data;

  @override
  build() {
    categoryUseCase = ref.read(categoryUseCaseProvider);

    return const UiState<List<Category>>.loading();
  }

  Future<void> getCategory() async {
    final result = await categoryUseCase.getCategories();

    if (!state.loading) {
      state = const UiState.loading();
    }

    result.when(
      success: (list) => state = UiState.data(list),
      failure: (e) => state = UiState.error(e.message),
    );
  }
}
