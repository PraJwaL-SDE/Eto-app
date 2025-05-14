import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageManager {
  final ImagePicker _picker = ImagePicker();

  /// Picks an image from the gallery and returns a `File`.
  /// Prints any errors encountered during the process.
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        print('No image selected.');
        return null;
      }
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }
}
