import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_category_notifier.g.dart';

@Riverpod(keepAlive: true)
class SelectedCategoriesNotifier extends _$SelectedCategoriesNotifier {
  @override
  List<Category> build() {
    return [];
  }

  void resetAndAdd(Category category) {
    state = [category];
  }

  void add(Category category) {
    state = [...state, category];
  }

  void remove(Category category) {
    state = state.where((element) => element.id != category.id).toList();
  }

  void clear() {
    state = [];
  }

  bool contains(Category category) {
    return state.any((element) => element.id == category.id);
  }

  bool get isEmpty => state.isEmpty;
  List<String> get categories => state
      .map(
        (e) => e.title.toLowerCase().replaceAll(' ', ''),
      )
      .toList();
}
