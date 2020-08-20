import 'package:aprender_haciendo_app/core/services/authRequest.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final _auth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _auth.onAuthStateChanged.map(
    (FirebaseUser user) => user?.uid,
  );

  // Email & Password Sign Up
  Future<AuthenticationRequest> createUser(
      {String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        authRequest.success = true;
      }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  // GET UID
  Future<String> getCurrentUID() async {
  try {
      return (await _auth.currentUser()).uid;
    } catch (e) {
      print(e);
    }
    return null;
  }
  
  // GET CURRENT USER
  Future<FirebaseUser> getCurrentUser() async {
    try {
      return await _auth.currentUser();
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<AuthenticationRequest> loginUser(
      {String email = "", String password = ""}) async {
    AuthenticationRequest authRequest = AuthenticationRequest();
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        authRequest.success = true;
      }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);
    }
    return authRequest;
  }

  // Sign Out
  Future<void> singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Reset Password
  Future sendPasswordResetEmail(String email) async {
    try {
       await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
    return null;
  }

  void _mapErrorMessage(AuthenticationRequest authRequest, String code) {
    switch (code) {
      case 'ERROR_USER_NOT_FOUND':
        authRequest.errorMessage = "Usuario no encontrado";
        break;
      case 'ERROR_WRONG_PASSWORD':
        authRequest.errorMessage = "Contraseña invalida";
        break;
      case 'ERROR_NETWORK_REQUEST_FAIL':
        authRequest.errorMessage = "Error de Red";
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        authRequest.errorMessage = "Usuario ya registrado";
        break;
      default:
        authRequest.errorMessage = code;
    }
  }
}
