import 'package:hooks_riverpod/hooks_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  return "Hello World";
});

// final userProvider = FutureProvider.autoDispose.family<User, int>((ref, userId) async {
//   return fetchUser(userId);
// });