import 'package:flutter/material.dart';

class Driver {
  final String id;
  final String email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
   String? name;
   String? contact;
   DateTime? dob;
   int? age;
   int? coin;
   String? firstName;
   String? lastName;

  Driver({
    required this.id,
    required this.email,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.contact,
    this.dob,
    this.age,
    this.coin,
    this.firstName,
    this.lastName,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['update_at'] != null
          ? DateTime.parse(json['update_at'])
          : null,
      name: json['name'] as String?,
      contact: json['contact'] as String?,
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      age: json['age'] as int?,
      coin: json['coin'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'created_at': createdAt?.toIso8601String(),
      'update_at': updatedAt?.toIso8601String(),
      'name': name,
      'contact': contact,
      'dob': dob?.toIso8601String(),
      'age': age,
      'coin': coin,
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}
