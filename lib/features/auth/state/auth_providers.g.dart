// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

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

String $AuthStateNotifierHash() => r'1e23b50bb50c429e50b0e4970bdb44ba1ccd4f87';

/// See also [AuthStateNotifier].
final authStateNotifierProvider =
    AutoDisposeNotifierProvider<AuthStateNotifier, AuthState>(
  AuthStateNotifier.new,
  name: r'authStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $AuthStateNotifierHash,
);
typedef AuthStateNotifierRef = AutoDisposeNotifierProviderRef<AuthState>;

abstract class _$AuthStateNotifier extends AutoDisposeNotifier<AuthState> {
  @override
  AuthState build();
}

String $firebaseAuthHash() => r'7791bf70ce0f01bf991a53a76abc915478673c0b';

/// See also [firebaseAuth].
final firebaseAuthProvider = AutoDisposeProvider<FirebaseAuth>(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $firebaseAuthHash,
);
typedef FirebaseAuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String $authRepositoryHash() => r'25ddc1e8793131d82095be4bba5875b118dca5bc';

/// See also [authRepository].
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $authRepositoryHash,
);
typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String $currentUserHash() => r'13b6b9f1ea26eb29308e31365a2e2c520e75d670';

/// See also [currentUser].
final currentUserProvider = AutoDisposeProvider<User?>(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $currentUserHash,
);
typedef CurrentUserRef = AutoDisposeProviderRef<User?>;
String $currentUserIdHash() => r'84bc2174cac75080f7d11cc1edab8daafee14df1';

/// See also [currentUserId].
final currentUserIdProvider = AutoDisposeProvider<String?>(
  currentUserId,
  name: r'currentUserIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $currentUserIdHash,
);
typedef CurrentUserIdRef = AutoDisposeProviderRef<String?>;
