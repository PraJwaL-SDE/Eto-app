class Passenger {
  final String id; // Required
  final DateTime? createdAt; // Nullable
  final DateTime? updatedAt; // Nullable
  final String email; // Required
  final String? contact; // Nullable
   String? firstName; // Nullable
   String? lastName; // Nullable
  final String? name; // Nullable
  final String? password; // Nullable
  final String? gender; // Nullable
  final DateTime? dob; // Nullable
  final int? coin; // Nullable
  final String? language; // Nullable
  final int? age; // Nullable
  final String? googleId; // Nullable
  final String? profilePic; // Nullable

  Passenger({
    required this.id,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.contact,
    this.firstName,
    this.lastName,
    this.name,
    this.password,
    this.gender,
    this.dob,
    this.coin,
    this.language = 'en',
    this.age,
    this.googleId,
    this.profilePic,
  });

  // Factory constructor to parse from JSON
  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      id: json['id'] ?? '', // Default to an empty string if null
      email: json['email'] ?? '', // Default to an empty string if null
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null, // Nullable
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null, // Nullable
      contact: json['contact'], // Nullable
      firstName: json['first_name'], // Nullable
      lastName: json['last_name'], // Nullable
      name: json['name'], // Nullable
      password: json['password'], // Nullable
      gender: json['gender'], // Nullable
      dob: json['dob'] != null
          ? DateTime.parse(json['dob'])
          : null, // Nullable
      coin: json['coin'] != null
          ? int.tryParse(json['coin'].toString())
          : null, // Nullable
      language: json['language'] ?? 'en', // Default to 'en' if null
      age: json['age'] != null
          ? int.tryParse(json['age'].toString())
          : null, // Nullable
      googleId: json['google_id'], // Nullable
      profilePic: json['profile_pic'], // Nullable
    );
  }

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id.isNotEmpty ? id : '', // Ensure id is not null or empty
      'email': email.isNotEmpty ? email : '', // Ensure email is not null or empty
      'created_at': createdAt?.toIso8601String(), // Nullable
      'updated_at': updatedAt?.toIso8601String(), // Nullable
      'contact': contact,
      'first_name': firstName,
      'last_name': lastName,
      'name': name,
      'password': password,
      'gender': gender,
      'dob': dob?.toIso8601String(), // Nullable
      'coin': coin,
      'language': language ?? 'en', // Default to 'en' if null
      'age': age,
      'google_id': googleId,
      'profile_pic': profilePic,
    };
  }


  @override
  String toString() {
    return 'Passenger{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, email: $email, contact: $contact, firstName: $firstName, lastName: $lastName, name: $name, password: $password, gender: $gender, dob: $dob, coin: $coin, language: $language, age: $age, googleId: $googleId, profilePic: $profilePic}';
  }
}
