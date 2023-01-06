import 'package:elvan/core/result/result.dart';
import 'package:elvan_shared/dtos/category/category_dto.dart';

abstract class CategoryRepository {
  Future<Result<List<CategoryDto>>> getCategories();
}
