import 'package:eto_ride/app/core/utils/api_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateDriverDocument {
  // Helper function to send HTTP POST requests
  Future<void> _postRequest(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      // Check for HTTP errors
      if (response.statusCode != 200) {
        print('Failed to update. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        print('Update successful. Response: ${response.body}');
      }
    } catch (e) {
      print('Error occurred while sending request: $e');
    }
  }

  // Update Aadhar Card
  Future<void> updateAadhar(String userId, String number, String docLink) async {
    final body = {
      'user_id': userId,
      'number': number,
      'doc_link': docLink,
    };
    await _postRequest(ApiConfig.updateAadhar, body);
  }

  // Update PAN Card
  Future<void> updatePan(String userId, String number, String docLink) async {
    final body = {
      'user_id': userId,
      'number': number,
      'doc_link': docLink,
    };
    await _postRequest(ApiConfig.updatePan, body);
  }

  // Update Registration Certificate
  Future<void> updateRC(String userId, String vehicleNumber, String docLink) async {
    final body = {
      'user_id': userId,
      'vehicle_number': vehicleNumber,
      'doc_link': docLink,
    };
    await _postRequest(ApiConfig.updateVehicleRC, body);
  }

  // Update Vehicle Insurance
  Future<void> updateInsurance(String userId, String docLink) async {
    final body = {
      'user_id': userId,
      'doc_link': docLink,
    };
    await _postRequest(ApiConfig.updateInsurance, body);
  }

  // Update Vehicle Permit
  Future<void> updateVehiclePermit(String userId, String docLink) async {
    final body = {
      'user_id': userId,
      'doc_link': docLink,
    };
    await _postRequest(ApiConfig.updateVehiclePermit, body);
  }

  // Update Bank Account
  Future<void> updateBankAccount(
      String userId, String accountNumber, String docLink, String ifscCode, String holderName) async {
    final body = {
      'user_id': userId,
      'account_number': accountNumber,
      'doc_link': docLink,
      'ifsc_code': ifscCode,
      'holder_name': holderName,
    };
    await _postRequest(ApiConfig.updateBankAccount, body);
  }

  // Update Driving License
  Future<void> updateDrivingLicence(
      String userId, String number, String docLink, String dob) async {
    final body = {
      'user_id': userId,
      'number': number,
      'doc_link': docLink,
      'dob': dob,
    };
    await _postRequest(ApiConfig.updateDrivingLicense, body);
  }
}
