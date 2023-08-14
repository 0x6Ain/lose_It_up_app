// part 'fake_auth_repository.g.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lose_it_up_app/dummy/delay.dart';
import 'package:lose_it_up_app/dummy/dummy_data.dart';
import 'package:lose_it_up_app/dummy/in_memory_store.dart';
import 'package:lose_it_up_app/exceptions/app_exception.dart';
import 'package:lose_it_up_app/features/authentication/data/auth_repository.dart';
import 'package:lose_it_up_app/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_auth_repository.g.dart';

class FakeAuthRepository extends AuthRepository {
  FakeAuthRepository({this.isDelay = true});
  final bool isDelay;
  final _authState = InMemoryStore<User?>(null);

  // List to keep track of all user accounts
  final List<User> _users = [kUser];
  User? get currentUser => _authState.value;
  @override
  Future<User?> fetchUser() {
    delay(isDelay);
    _authState.value = kUser;
    return Future.value(kUser);
  }

  @override
  Stream<User?> authStateChanges() {
    return _authState.stream;
  }

  @override
  Future<void> signIn(String email, String password) async {
    await delay(isDelay);
    debugPrint('signIn-in fakeAuthRepo');

    for (final user in _users) {
      if (user.email == email) {
        if (password == '12341234') {
          _authState.value = user;
          return;
        } else {
          throw WrongPasswordException();
        }
      }
    }
    throw UserNotFoundException();
  }

  @override
  Future<void> signOut() async {
    await delay(isDelay);
    debugPrint('signOut-in fakeAuthRepo');

    _authState.value = null;
  }

  @override
  Future<void> signUp(String email, String password) async {
    await delay(isDelay);
    debugPrint('signUp-in fakeAuthRepo');
    for (final u in _users) {
      if (u.email == email) {
        throw EmailAlreadyInUseException();
      }
    }
    // minimum password length requirement
    if (password.length < 8) {
      throw WeakPasswordException();
    }
    // create new user
    final newUser = User(
      uid: email.split('').reversed.join(),
      email: email,
    );
    _users.add(newUser);

    _authState.value = newUser;
  }

  void dispose() => _authState.close();
}

@Riverpod(keepAlive: true)
FakeAuthRepository authRepository(AuthRepositoryRef ref) {
  final auth = FakeAuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}
