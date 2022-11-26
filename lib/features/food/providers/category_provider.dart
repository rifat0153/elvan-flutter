import 'dart:developer';

import 'package:elvan/features/food/models/category/category.dart';
import 'package:elvan/shared/providers/firebase/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
Future<List<Category>> categoryList(CategoryListRef ref) {
  return ref.watch(firebaseFirestoreProvider).collection('categories').get().then((value) {
    return value.docs.map((e) => Category.fromJson(e.data())).toList();
  });
}

@riverpod
class CategoryListNotifier extends _$CategoryListNotifier {
  @override
  FutureOr<List<Category>> build() async {
    try {
      final value = await ref.watch(firebaseFirestoreProvider).collection('categories').get().then((value) {
        return value.docs.map((e) => Category.fromJson(e.data())).toList();
      });

      if (value.isEmpty) throw Exception('No data');

      log('CategoryListNotifier: build: $value');

      return value;
    } catch (e) {
      log('CategoryListNotifier error: $e');
      return Future.error(e);
    }
  }
}

final selectedIDProvider = Provider<int>((ref) {
  throw UnimplementedError();
});
