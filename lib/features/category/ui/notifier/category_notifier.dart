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
}
