import 'package:eto_ride/app/core/utils/private_keys.dart';

class ApiConfig{
  static const String baseUrl = "${PrivateKeys.serverUrl}/api/v1";
  static const String passengerGoogleSignIn  = baseUrl + "/auth/passenger/signInWithGoogle";
  static const String driverGoogleSignIn = baseUrl +"/auth/driver/signInWithGoogle";
  static const String passengerUpdate = baseUrl +"/auth/passenger/update";
  static const String driverUpdate = baseUrl +"/auth/driver/update";
  static const String socketUrl = "https://eto-ride-backend.onrender.com";
  static const String availableRides =baseUrl +  "/ride/availableRides";

  static const String updateAadhar = baseUrl + "/driver/updateAadhar";
  static const String updatePan = baseUrl + "/driver/updatePan";
  static const String updateBankAccount = baseUrl + "/driver/updateBankAccount";
  static const String updateDrivingLicense = baseUrl + "/driver/updateDrivingLicence";
  static const String updateVehiclePermit = baseUrl + "/driver/updateVehiclePermit";
  static const String updateInsurance= baseUrl + "/driver/updateInsurance";
  static const String updateVehicleRC = baseUrl + "/driver/updateRC";
  static const String checkDriverDocuments = baseUrl + "/driver/checkDriverDocuments";

  static const String checkDriverAvailable = baseUrl  + "/driver/checkAvailable";
  static const String changeDriverAvailable = baseUrl + "/driver/changeAvailability";
  static const String getDriverRideRequest = baseUrl + "/driver/getDriverRideRequest";

  static const String getRideOtp = baseUrl + "/ride/getOtp";
  static const String verifyRideOtp = baseUrl + "/ride/matchOtp";

  static const String addRideRequest = baseUrl + "/ride/addRideRequest";




}