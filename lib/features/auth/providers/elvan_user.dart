import 'package:elvan/features/auth/constants/constants.dart';
import 'package:elvan/features/auth/models/elvan_user.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/shared/providers/firebase/firebase_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'elvan_user.g.dart';

@riverpod
class ElvanUserNotifer extends _$ElvanUserNotifer {
  @override
  FutureOr<ElvanUser?> build() async {
    final currentUser = ref.watch(currentUserProvider);

    if (currentUser == null) {
      return null;
    }

    final elvanUser = await ref
        .watch(firebaseFirestoreProvider)
        .collection(
          Constants.firebaseElvanUserCollectionName,
        )
        .withConverter(
          fromFirestore: (snapshot, _) => ElvanUser.fromJson(snapshot.data()!),
          toFirestore: (elvanUser, _) => elvanUser.toJson(),
        )
        .doc(currentUser.uid)
        .get();

    return elvanUser.data();
  }
}
