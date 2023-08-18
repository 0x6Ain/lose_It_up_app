import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:lose_it_up_app/features/authentication/presentation/sign_in/sign_in_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  const testEmail = '0@test.com';
  const testPassword = '12341234';
  const testFormType = SignInFormType.email;
  ProviderContainer makeProviderContainer(MockAuthRepository authRepository) {
    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('EmailPasswordSignInController', () {
    test('sign in success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.signIn(
            testEmail,
            testPassword,
          )).thenAnswer((_) => Future.value());
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        signInControllerProvider,
        listener,
        fireImmediately: true,
      );
      const data = AsyncData<void>(null);
      // verify initial value from build method
      verify(() => listener(null, data));
      // run
      final controller = container.read(signInControllerProvider.notifier);
      final result = await controller.submit(
        email: testEmail,
        password: testPassword,
        signInFormType: testFormType,
      );
      // verify
      expect(result, true);
      verifyInOrder([
        // set loading state
        () => listener(data, any(that: isA<AsyncLoading>())),
        // data when complete
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
    });

    test('sign in failure', () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(() => authRepository.signIn(
            testEmail,
            'wrongPassword',
          )).thenThrow(exception);
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        signInControllerProvider,
        listener,
        fireImmediately: true,
      );
      // verify initial value from build method
      verify(() => listener(null, const AsyncData<void>(null)));
      // run
      final controller = container.read(signInControllerProvider.notifier);
      final result = await controller.submit(
        email: testEmail,
        password: testPassword,
        signInFormType: testFormType,
      );
      // verify
      expect(result, false);
      verifyInOrder([
        // set loading state
        () => listener(const AsyncData<void>(null), any(that: isA<AsyncLoading>())),
        // error when complete
        () => listener(any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
    });
  });
}
