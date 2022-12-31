import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/features/category/data/repository/category_repository_impl.dart';
import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/features/category/domain/repository/category_repository.dart';

final categoryUseCaseProvider = Provider<CategoryUseCase>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);

  return CategoryUseCase(categoryRepository: categoryRepository);
});

class CategoryUseCase {
  final CategoryRepository categoryRepository;

  CategoryUseCase({required this.categoryRepository});

  Future<List<Category>> getCategories() async {
    final categories = await categoryRepository.getCategories();

    return categories.when(
      success: (categories) {
        return categories
            .map(
              (e) => Category.fromDto(e),
            )
            .toList();
      },
      failure: (failure) => throw failure,
    );
  }
}
