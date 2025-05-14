import 'package:eto_ride/app/core/utils/enums/user_type.dart';
import 'package:eto_ride/app/data/models/driver_model.dart';
import 'package:eto_ride/app/data/models/passenger_model.dart';
import 'package:eto_ride/app/data/provider/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define Authentication States
abstract class GoogleAuthState {}

class AuthInitial extends GoogleAuthState {

}

class AuthLoading extends GoogleAuthState {}

class Authenticated extends GoogleAuthState {
  final User user;
  Authenticated(this.user);
}

class CreateProfile extends GoogleAuthState {
  final User user;
  CreateProfile({required this.user});
}

class LoginSuccess extends GoogleAuthState {
  final Passenger? passenger;
  final Driver? driver;
  LoginSuccess({ this.passenger,this.driver});
}

class AuthError extends GoogleAuthState {
  final String message;
  AuthError(this.message);
}

// Define the GoogleAuthCubit
class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(AuthInitial());

  Future<void> signInWithGoogle({UserType userType = UserType.PASSENGER}) async {
    emit(AuthLoading());
    try {
      // Check if the user is already signed in
      User? user = await AuthServices.checkCurrentUser();

      if (user != null) {
        // If user exists, log them in
        try {
          // final passenger = await AuthServices.login(user.uid);
          if(userType==UserType.PASSENGER){
            final passenger  = await AuthServices.signInPassengerWithGoogle();
            emit(LoginSuccess(passenger: passenger!));
          }else{
            final driver  = await AuthServices.signInDriverWithGoogle();
            emit(LoginSuccess(driver: driver!));
          }


        } catch (e) {
          emit(AuthError("Failed to login: $e"));
        }
      } else {
        // Sign in with Google
        try {
          if(userType==UserType.PASSENGER){

          }
          final passenger  = await AuthServices.signInPassengerWithGoogle();
          print(passenger);
          if (passenger != null) {
            emit(LoginSuccess(passenger: passenger));
          } else {
            emit(AuthError("Google sign-in failed. User is null."));
          }
        } catch (e) {
          emit(AuthError("Google sign-in error: $e"));
        }
      }
    } catch (e) {
      emit(AuthError("Unexpected error: $e"));
    }
  }
}
