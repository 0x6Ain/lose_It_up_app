import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_screen_controller.g.dart';

@riverpod
class AccountScreenController extends _$AccountScreenController {
  @override
  FutureOr<void> build() {
    // return;
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    print('sign out in controller');
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }

  Future<void> delete() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.delete());
  }
}