import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/category/data/dto/category_dto.dart';

abstract class CategoryRepository {
  Future<Result<List<CategoryDto>>> getCategories();
}
