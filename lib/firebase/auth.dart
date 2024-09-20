import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a User object based on FirebaseUser
  User? _userFromFirebase(User? user) {
    return user;
  }

  // Stream to listen to authentication changes (sign-in / sign-out)
  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // Sign Up with Email and Password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print("Error in sign-up: $e");
      return null;
    }
  }

  // Sign In with Email and Password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print("Error in sign-in: $e");
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Error in sign-out: $e");
      return;
    }
  }


  // Get Current User
  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch (e) {
      print("Error getting current user: $e");
      return null;
    }
  }
// Get Current User Email
Future<String?> getCurrentUserEmail() async {
  try {
    User? user = _auth.currentUser;
    return user?.email; // Returns the email or null if no user is logged in
  } catch (e) {
    print("Error getting current user email: $e");
    return null;
  }
}
}


