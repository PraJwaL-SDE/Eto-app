import 'dart:io';
import 'package:eto_ride/app/core/utils/api_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServerImageProvider {
  /// Uploads an image file to the server and returns the public URL of the uploaded file.
  /// Prints errors if the upload fails.
  Future<String?> uploadImage(File imageFile) async {
    try {
      // Prepare the request
      final uri = Uri.parse(ApiConfig.baseUrl + "/upload");
      final request = http.MultipartRequest("POST", uri);

      // Attach the file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'file', // Field name as expected by the server
          imageFile.path,
        ),
      );

      // Send the request
      final response = await request.send();

      // Read and decode the response
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(responseBody);

      if (response.statusCode == 200) {
        print('Image uploaded successfully.');
        return jsonResponse['data']['publicUrl']; // Adjust key based on your response structure
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        print('Error: ${jsonResponse['error']}');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
