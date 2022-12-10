import 'package:elvan/core/supabase/supbase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:supabase_flutter/supabase_flutter.dart' show AuthState, SupabaseAuth, SupabaseClient;

final authRepositoryProvider = Provider<AuthSupabaseRepository>((ref) {
  return AuthSupabaseRepository(
    auth: ref.watch(supabaseAuthProvider),
    supabase: ref.watch(supabaseClientProvider),
  );
});

class AuthSupabaseRepository {
  const AuthSupabaseRepository({
    required this.auth,
    required this.supabase,
  });

  final SupabaseAuth auth;
  final SupabaseClient supabase;

  Stream<AuthState> getUserStream() {
    return supabase.auth.onAuthStateChange;
  }

  Future<User> singInWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement singInWithEmailAndPassword
    throw UnimplementedError();
  }

  Future<bool> signOut() async {
    supabase.auth.signOut();
    return true;
  }
}
