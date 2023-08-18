import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:lose_it_up_app/features/settings/account/presentatation/account_screen_controller.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
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

  group('AccountScreenController', () {
    test('initial state is AsyncData', () {
      // setup
      final authRepository = MockAuthRepository();
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      // verify
      verify(
        () => listener(null, const AsyncData<void>(null)),
      );
      // verify that the listener is no longer called
      verifyNoMoreInteractions(listener);
      // verify that [signInAnonymously] was not called during initialization
      verifyNever(authRepository.signOut);
    });

    test('signOut success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(authRepository.signOut).thenAnswer((_) => Future.value());
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      // sto
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      final controller = container.read(accountScreenControllerProvider.notifier);
      await controller.signOut();
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(authRepository.signOut).called(1);
    });
    test('signOut failure', () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(authRepository.signOut).thenThrow(exception);
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );

      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      final controller = container.read(accountScreenControllerProvider.notifier);
      await controller.signOut();
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(authRepository.signOut).called(1);
    });
    test('delete success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(authRepository.delete).thenAnswer((_) => Future.value());
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );
      // sto
      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      final controller = container.read(accountScreenControllerProvider.notifier);
      await controller.delete();
      // verify
      verifyInOrder([
        () => listener(data, any(that: isA<AsyncLoading>())),
        () => listener(any(that: isA<AsyncLoading>()), data),
      ]);
      verifyNoMoreInteractions(listener);
      verify(authRepository.delete).called(1);
    });
    test('delete failure', () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(authRepository.delete).thenThrow(exception);
      final container = makeProviderContainer(authRepository);
      final listener = Listener<AsyncValue<void>>();
      container.listen(
        accountScreenControllerProvider,
        listener,
        fireImmediately: true,
      );

      const data = AsyncData<void>(null);
      verify(() => listener(null, data));
      // run
      final controller = container.read(accountScreenControllerProvider.notifier);
      await controller.delete();
      // verify
      verifyInOrder([
        // set loading state
        // * use a matcher since AsyncLoading != AsyncLoading with data
        () => listener(data, any(that: isA<AsyncLoading>())),
        // error when complete
        () => listener(any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(authRepository.delete).called(1);
    });
  });
}
