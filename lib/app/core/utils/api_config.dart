class ApiConfig{
  static const String baseUrl = "https://eto-ride-backend.onrender.com/api/v1";
  static const String passengerGoogleSignIn  = baseUrl + "/auth/passenger/signInWithGoogle";
  static const String driverGoogleSignIn = baseUrl +"/auth/driver/signInWithGoogle";
  static const String passengerUpdate = baseUrl +"/auth/passenger/update";
  static const String driverUpdate = baseUrl +"/auth/driver/update";
  static const String socketUrl = "https://eto-ride-backend.onrender.com";
  static const String availableRides =baseUrl +  "/ride/availableRides";

  static const String updateAadhar = baseUrl + "driver/updateAadhar";
  static const String updatePan = baseUrl + "driver/updatePan";
  static const String updateBankAccount = baseUrl + "driver/updateBankAccount";
  static const String updateDrivingLicense = baseUrl + "driver/updateDrivingLicence";
  static const String updateVehiclePermit = baseUrl + "driver/updateVehiclePermit";
  static const String updateInsurance= baseUrl + "driver/updateInsurance";
  static const String updateVehicleRC = baseUrl + "driver/updateRC";




}