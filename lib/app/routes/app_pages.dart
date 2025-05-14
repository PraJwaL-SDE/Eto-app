import 'package:eto_ride/app/core/utils/enums/user_type.dart';
import 'package:eto_ride/app/modules/auth/controller/verify_otp_controller.dart';
import 'package:eto_ride/app/modules/auth/view/enter_detail_screen.dart';
import 'package:eto_ride/app/modules/auth/view/enter_location_screen.dart';
import 'package:eto_ride/app/modules/auth/view/enter_moble_screen.dart';
import 'package:eto_ride/app/modules/auth/view/verify_otp_screen.dart';
import 'package:eto_ride/app/modules/coins/view/coin_screen.dart';
import 'package:eto_ride/app/modules/coins/view/coin_transaction_screen.dart';
import 'package:eto_ride/app/modules/distance/view/driver_total_distance_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_aadhar_card_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_bank_detail_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_driving_license_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_pan_card_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_profile_photo_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_registration_certificate_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_vehicle_insurance_screen.dart';
import 'package:eto_ride/app/modules/driver/view/add_vehicle_permit_screen.dart';
import 'package:eto_ride/app/modules/driver/view/driver_document_screen.dart';
import 'package:eto_ride/app/modules/get_started/controller/get_started_controller.dart';
import 'package:eto_ride/app/modules/get_started/controller/select_language_controller.dart';
import 'package:eto_ride/app/modules/get_started/view/get_started_screen.dart';
import 'package:eto_ride/app/modules/get_started/view/select_language_screen.dart';
import 'package:eto_ride/app/modules/help_support/view/help_support_screen.dart';
import 'package:eto_ride/app/modules/notification/view/notification_screen.dart';
import 'package:eto_ride/app/modules/payment/view/driver_payout_screen.dart';
import 'package:eto_ride/app/modules/payment/view/driver_total_earning_screen.dart';
import 'package:eto_ride/app/modules/payment/view/payment_setting_screen.dart';
import 'package:eto_ride/app/modules/payment/view/transactions_screen.dart';
import 'package:eto_ride/app/modules/profile/view/driver_profile_screen.dart';
import 'package:eto_ride/app/modules/rating/view/rating_info_screen.dart';
import 'package:eto_ride/app/modules/refer/view/refer_earn_screen.dart';
import 'package:eto_ride/app/modules/ride/view/ride_complete_screen.dart';
import 'package:eto_ride/app/modules/ride/view/ride_detail_screen.dart';
import 'package:eto_ride/app/modules/security/view/safety_security_screen.dart';
import 'package:eto_ride/app/modules/splash/view/splash_screen.dart';
import 'package:get/get.dart';
import '../modules/get_started/controller/user_type_controller.dart';
import '../modules/get_started/view/user_type_screen.dart';
import '../modules/profile/controller/driver_profile_controller.dart';
import '../modules/shell/binding/shell_binding.dart';
import '../modules/shell/view/shell_view.dart';
import 'app_routes.dart';
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SHELL,
      page: () => ShellView(userType: Get.arguments['userType'], user: Get.arguments['user']),
      binding: ShellBinding(),
    ),

    GetPage(
      name: AppRoutes.SELECT_LANGUAGE,
      page: () => SelectLanguageScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SelectLanguageController>(() => SelectLanguageController());
      }),
    ),
    GetPage(
      name: AppRoutes.PAYMENT_SETTING,
      page: () => PaymentSettingScreen(),

    ),
    GetPage(
      name: AppRoutes.TRANSACTIONS,
      page: () => TransactionsScreen(),

    ),
    GetPage(
      name: AppRoutes.RATING_INFO,
      page: () => RatingInfoScreen(),

    ),
    GetPage(
      name: AppRoutes.HELP_SUPPORT,
      page: () => HelpSupportScreen(),

    ),
    GetPage(
      name: AppRoutes.SAFETY_SECURITY,
      page: () => SafetySecurityScreen(),

    ),
    GetPage(
      name: AppRoutes.REFER_EARN,
      page: () => ReferEarnScreen(),

    ),
    GetPage(
      name: AppRoutes.COIN_BALANCE,
      page: () => CoinScreen(),

    ),
    GetPage(
      name: AppRoutes.COIN_TRANSACTION,
      page: () => CoinTransactionScreen(),

    ),
    GetPage(
      name: AppRoutes.NOTIFICATION,
      page: () => NotificationScreen(),

    ),

    GetPage(
      name: AppRoutes.USER_TYPE,
      page: () =>  UserTypeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<UserTypeController>(() => UserTypeController());
      }),
    ),


    GetPage(
      name: AppRoutes.GET_STARTED,
      page: () => GetStartedScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<GetStartedController>(() => GetStartedController(userType: UserType.PASSENGER));
      }),
    ),

    GetPage(
      name: AppRoutes.ENTER_MOBILE,
      page: () =>  EnterMobileScreen(userType: Get.arguments['userType'],),
      binding: BindingsBuilder(() {

      }),
    ),
    GetPage(
      name: AppRoutes.VERIFY_OTP,
      page: () =>  VerifyOtpScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<VerifyOtpController>(() => VerifyOtpController());

      }),
    ),

    GetPage(
      name: AppRoutes.ENTER_DETAIL,
      page: () =>  EnterDetailScreen(user: Get.arguments['user'],userType: Get.arguments['userType'],),
      binding: BindingsBuilder(() {


      }),
    ),
    GetPage(
      name: AppRoutes.ENTER_LOCATION,
      page: () =>  EnterLocationScreen(),
      binding: BindingsBuilder(() {

      }),
    ),
    GetPage(
      name: AppRoutes.DRIVER_DOCUMENTS,
      page: () {
        final arguments = Get.arguments;
        final driverId = arguments['driverId'];
        return DriverDocumentScreen(driverId: driverId);
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_DRIVING_LICENSE,
      page: () {
        final arguments = Get.arguments;
        final userId = arguments['userId'];
        return AddDrivingLicenseScreen(userId: userId);
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_PROFILE_PHOTO,
      page: () {
        // final arguments = Get.arguments;
        // final userId = arguments['userId'];
        return AddProfilePhotoScreen();
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_AADHAR_CARD,
      page: () {
        final arguments = Get.arguments;
        final userId = arguments['userId'];
        return AddAadharCardScreen(userId: userId);
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_PAN_CARD,
      page: () {
        final arguments = Get.arguments;
        final userId = arguments['userId'];
        return AddPanCardScreen(userId: userId);
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_REGISTRATION_CERTIFICATE,
      page: () {
        final arguments = Get.arguments;
        final userId = arguments['userId'];
        return AddRegistrationCertificateScreen(userId: userId);
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_VEHICLE_INSURANCE,
      page: () {
        final arguments = Get.arguments;
        final userId = arguments['userId'];
        return AddVehicleInsuranceScreen(userId: userId);
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_VEHICLE_PERMIT,
      page: () {
        final arguments = Get.arguments;
        final userId = arguments['userId'];
        return AddVehiclePermitScreen(userId: userId);
      },
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.DRIVER_BANK_DETAIL,
      page: () {
        final arguments = Get.arguments;
        final userId = arguments['userId'];
        return AddBankDetailScreen(userId: userId);
      },
      binding: BindingsBuilder(() {}),
    ),


    GetPage(
      name: AppRoutes.RIDE_DETAIL,
      page: () =>  RideDetailScreen(),
      binding: BindingsBuilder(() {

      }),
    ),
    GetPage(
      name: AppRoutes.RIDE_COMPLETE,
      page: () =>  RideCompleteScreen(),
      binding: BindingsBuilder(() {

      }),
    ),
    GetPage(
      name: AppRoutes.DRIVER_EARNING,
      page: () =>  DriverTotalEarningScreen(),
      binding: BindingsBuilder(() {

      }),
    ),

    GetPage(
      name: AppRoutes.DRIVER_DISTANCE,
      page: () =>  DriverTotalDistanceScreen(),
      binding: BindingsBuilder(() {

      }),
    ),
    GetPage(
      name: AppRoutes.DRIVER_PROFILE,
      page: () =>  DriverProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(()=>DriverProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.DRIVER_PAYOUT,
      page: () =>  DriverPayoutScreen(),
      binding: BindingsBuilder(() {

      }),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () =>  SplashScreen(),
      binding: BindingsBuilder(() {

      }),
    ),


    // ... other pages
  ];
}