// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $CategoryListNotifierHash() =>
    r'12d0ab68ea7200f6622c0bed5a85dc42dee6e37c';

/// See also [CategoryListNotifier].
final categoryListNotifierProvider =
    AutoDisposeAsyncNotifierProvider<CategoryListNotifier, List<Category>>(
  CategoryListNotifier.new,
  name: r'categoryListNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $CategoryListNotifierHash,
);
typedef CategoryListNotifierRef
    = AutoDisposeAsyncNotifierProviderRef<List<Category>>;

abstract class _$CategoryListNotifier
    extends AutoDisposeAsyncNotifier<List<Category>> {
  @override
  FutureOr<List<Category>> build();
}

String $categoryListHash() => r'4ec6f828f9c7288452de1c2082d31d52b27a1e10';

/// See also [categoryList].
final categoryListProvider = AutoDisposeFutureProvider<List<Category>>(
  categoryList,
  name: r'categoryListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $categoryListHash,
);
typedef CategoryListRef = AutoDisposeFutureProviderRef<List<Category>>;
