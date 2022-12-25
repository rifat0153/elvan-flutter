import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/category/domain/repository/category_repository.dart';
import 'package:elvan/features/category/data/repository/category_repository_impl.dart';
import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final categoryUseCaseProvider = Provider<CategoryUseCase>((ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);

  return CategoryUseCase(categoryRepository: categoryRepository);
});

class CategoryUseCase {
  final CategoryRepository categoryRepository;

  CategoryUseCase({required this.categoryRepository});

  Future<Result<List<Category>>> getCategories() async {
    final categories = await categoryRepository.getCategories();

    return categories.when(
      success: (categories) {
        return Result.success(
          categories
              .map(
                (e) => Category.fromDto(e),
              )
              .toList(),
        );
      },
      failure: (failure) => Result.failure(failure),
    );
  }
}
