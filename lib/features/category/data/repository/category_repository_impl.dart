import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/category/data/dto/category_dto.dart';
import 'package:elvan/features/category/data/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final FirebaseFirestore firebaseFirestore;

  CategoryRepositoryImpl({required this.firebaseFirestore});

  @override
  Future<Result<List<CategoryDto>>> getCategories() async {
    
    try {
      final snapshot = await firebaseFirestore.collection('categories').get();
      final categories = snapshot.docs.map((doc) => CategoryDto.fromJson(doc.data())).toList();
      return Result.success(categories);
    } catch (e) {
      return Result.failure(Failure(error: e));
    }

  }
}
