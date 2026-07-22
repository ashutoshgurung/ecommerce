import 'package:ecommerce_app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthServices _authService = AuthServices();

  bool isLoading = false;

  Stream<User?> get authStateChanges => _authService.authStateChanges;

  Future<bool> login({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    final user = await _authService.logIn(email: email, password: password);

    isLoading = false;
    notifyListeners();

    return user != null;
  }

  Future<bool> signup({required String email, required String password}) async {
    isLoading = true;
    notifyListeners();

    final user = await _authService.signUp(email: email, password: password);

    isLoading = false;
    notifyListeners();

    return user != null;
  }

  Future<bool> SignInWithGoogle() async {
    isLoading = true;
    notifyListeners();
    final user = await _authService.signInWithGoogle();
    isLoading = false;
    notifyListeners();
    return user != null;
  }

  Future<void> logout() async {
    await _authService.logOut();
  }
}
