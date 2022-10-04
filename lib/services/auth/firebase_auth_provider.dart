import 'package:firebase_core/firebase_core.dart';
import 'package:fika/firebase_options.dart';
import 'package:fika/services/auth/auth_user.dart';
import 'package:fika/services/auth/auth_exceptions.dart';
import 'package:fika/services/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;

class FirebaseAuthProvider implements AuthProvider {
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    // TODO: implement createUser
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == "invalid-email") {
        throw InvalidEmailAuthException();
      } else if (e.code == "weak-password") {
        throw WeakPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  // TODO: implement currentUser
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) async{
    try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
     if (e.code == "user-not-found") {
               throw UserNotFoundAuthException();   
                } else if (e.code == "wrong-password") {
                  throw WrongPasswordAuthException(); 
                } else {
                  throw GenericAuthException();
                }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logout() async {
    final user = FirebaseAuth.instance.currentUser;
    if(user != null) {
      await FirebaseAuth.instance.signOut();
    }else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }
  
  @override
  Future<void> initialize() async{
    await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
  }
  
  @override
  Future<void> sendPasswordReset({required String toEmail}) async{
   try {
     await FirebaseAuth.instance.sendPasswordResetEmail(email: toEmail);
   }on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'firebase_auth/invalid-email' :
      throw InvalidEmailAuthException();
      case 'firebase_auth/user-not-found' :
      throw UserNotFoundAuthException();
      default :
      throw GenericAuthException();
    }
   } catch (_) {
     throw GenericAuthException();
   }
  }
}
