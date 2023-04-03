import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan_shared/dtos/category/category_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/firebase/firebase_providers.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/category/domain/repository/category_repository.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);

  return CategoryRepositoryImpl(firebaseFirestore: firestore);
});

class CategoryRepositoryImpl implements CategoryRepository {
  final FirebaseFirestore firebaseFirestore;

  CategoryRepositoryImpl({required this.firebaseFirestore});

  @override
  Future<Result<List<CategoryDto>>> getCategories() async {
    try {
      final snapshot = await firebaseFirestore.collection('categories').get();
      final categories = snapshot.docs
          .map(
            (doc) => CategoryDto.fromJson(doc.data()),
          )
          .toList();

      return Result.success(categories);
    } catch (e, _) {
      print("---------------$e");
      return Result.failure(Failure(error: e));
    }
  }
}
