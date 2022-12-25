// Supabase providers
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show SupabaseAuth, SupabaseClient, Supabase;

final supabaseAuthProvider = Provider<SupabaseAuth>((ref) {
  return SupabaseAuth.instance;
});

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});
