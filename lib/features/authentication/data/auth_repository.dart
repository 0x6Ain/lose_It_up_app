import 'package:lose_it_up_app/features/authentication/domain/user.dart';

abstract class AuthRepository {
  Future<User?> fetchUser();
  Stream<User?> authStateChanges();
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
}
