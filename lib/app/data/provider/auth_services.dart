import 'dart:convert';
import 'package:eto_ride/app/core/utils/api_config.dart';
import 'package:eto_ride/app/data/models/driver_model.dart';
import 'package:eto_ride/app/data/models/passenger_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/enums/user_type.dart';

class AuthServices {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<Passenger?> signInPassengerWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      if (googleAuth == null) return null;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      final userData = userCredential.user!;
      final response = await http.post(
        Uri.parse(ApiConfig.passengerGoogleSignIn),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": userData.email,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody["email_exist"] == true) {
          return Passenger.fromJson(responseBody["passenger"]);
        } else {
          return Passenger(
            id: responseBody["passenger"]["id"],
            createdAt: responseBody["passenger"]["created_at"] != null
                ? DateTime.parse(responseBody["passenger"]["created_at"])
                : DateTime.now(),
            updatedAt: responseBody["passenger"]["updated_at"] != null
                ? DateTime.parse(responseBody["passenger"]["updated_at"])
                : DateTime.now(),
            email: responseBody["passenger"]["email"],
            dob: DateTime.now(),
            contact: userData.phoneNumber ?? "",
            coin: 0,
            googleId: userData.uid,
            profilePic: userData.photoURL,
          );
        }
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  static Future<Driver?> signInDriverWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      if (googleAuth == null) return null;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);
      final userData = userCredential.user!;

      final response = await http.post(
        Uri.parse(ApiConfig.driverGoogleSignIn),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": userData.email,
        }),
      );
      final responseBody = jsonDecode(response.body);
      return Driver.fromJson(responseBody['driver']);

    } catch (_) {}
  }


  static Future<User?> checkCurrentUser() async {
    try {
      return firebaseAuth.currentUser;
    } catch (_) {
      return null;
    }
  }
}
