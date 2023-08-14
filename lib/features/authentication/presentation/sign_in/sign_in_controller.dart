import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

enum SignInFormType { email, socialLogin }

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {
    //nothing to do;
  }

  Future<bool> submit({
    required String email,
    required String password,
    required SignInFormType signInFormType,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _authenticate(email, password, signInFormType));
    return state.hasError == false;
  }

  Future<void> _authenticate(
    String email,
    String password,
    SignInFormType signInFormType,
  ) {
    final authRepository = ref.read(authRepositoryProvider);

    return authRepository.signIn(email, password);
  }
}
