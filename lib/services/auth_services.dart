import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<User?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the Google Sign-In process
        print("Google Sign-In was canceled by the user.");
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;

      if (googleAuth == null) {
        print("Failed to retrieve Google authentication details.");
        return null;
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the Firebase user
      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      return userCredential.user; // Extract the FirebaseAuth User object
    } catch (e) {
      // Catch and print any errors
      print("Error during Google Sign-In: $e");
      return null;
    }
  }


  static Future<User?> checkCurrentUser() async {
    try {
      // Fetch the current user
      return firebaseAuth.currentUser;
    } catch (e) {
      // Catch and print any errors
      print("Error fetching current user: $e");
      return null;
    }
  }
}
