import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final versionProvider = FutureProvider<String>((ref) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  return packageInfo.version;
});
