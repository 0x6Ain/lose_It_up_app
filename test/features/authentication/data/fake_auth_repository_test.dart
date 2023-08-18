import 'package:flutter_test/flutter_test.dart';
import 'package:lose_it_up_app/dummy/dummy_data.dart';
import 'package:lose_it_up_app/exceptions/app_exception.dart';
import 'package:lose_it_up_app/features/authentication/data/fake_auth_repository.dart';
import 'package:lose_it_up_app/features/authentication/domain/user.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final testUser = kUser;
  const email = 'test@test.com';
  const password = '12341234';
  const wrongPassword = '123411111';
  final newUser = User(uid: email.split('').reversed.join(), email: email);

  FakeAuthRepository makeAuthRepository() => FakeAuthRepository(
        isDelay: false,
      );
  group('fake auth repository', () {
    test('currentUser is null', () {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('fetchUser', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      //setup
      await authRepository.fetchUser();
      //verify
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('sign in success', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      //verify
      await authRepository.signIn(testUser.email, password);
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('sign in failure, throws when user not found', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      //verify
      await expectLater(() => authRepository.signIn('NotFound@test.com', '1234'),
          throwsA(isA<UserNotFoundException>()));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('sign in failure, throws WrongPasswordException', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      //verify
      await expectLater(() => authRepository.signIn(testUser.email, wrongPassword),
          throwsA(isA<WrongPasswordException>()));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('sign up success - currentUser is not null after registration', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      //verify
      await authRepository.signUp(newUser.email, '12341236');
      expect(authRepository.currentUser, newUser);
      expect(authRepository.authStateChanges(), emits(newUser));
    });
    test('sign up failure - EmailAlreadyInUseException', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      //verify
      expectLater(() => authRepository.signUp(testUser.email, '12341236'),
          throwsA(isA<EmailAlreadyInUseException>()));
      expect(authRepository.currentUser, null);
    });

    test('sign up failure - WeakPasswordException', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      //verify
      expectLater(() => authRepository.signUp(newUser.email, '1234'),
          throwsA(isA<WeakPasswordException>()));
      expect(authRepository.currentUser, null);
    });
    test('currentUser is null after sign out', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      await authRepository.signUp(newUser.email, '12341236');
      expect(authRepository.currentUser, newUser);
      expect(authRepository.authStateChanges(), emits(newUser));

      //when
      await authRepository.signOut();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
    test('currentUser is null after delete account', () async {
      final authRepository = makeAuthRepository();
      addTearDown(authRepository.dispose);
      expect(authRepository.currentUser, null);
      await authRepository.signUp(newUser.email, '12341236');
      expect(authRepository.currentUser, newUser);
      expect(authRepository.authStateChanges(), emits(newUser));

      //when
      await authRepository.delete();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
    test('create user after dispose throws exception', () {
      final authRepository = makeAuthRepository();
      authRepository.dispose();
      expect(
        () => authRepository.signUp(
          newUser.email,
          password,
        ),
        throwsStateError,
      );
    });
  });
}
