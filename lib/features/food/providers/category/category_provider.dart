import 'package:elvan/features/food/constants/constant.dart';
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
    final value = await ref
        .watch(firebaseFirestoreProvider)
        .collection(
          Constants.categoryCollection,
        )
        .get()
        .then((value) {
      return value.docs.map((e) => Category.fromJson(e.data())).toList();
    });

    if (value.isEmpty) throw Exception('No data');

    return value;
  }
}

final selectedIDProvider = Provider<int>((ref) {
  throw UnimplementedError();
});
