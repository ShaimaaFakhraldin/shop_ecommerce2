// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;
  bool status = false;
  String message ='';

  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
    required this.message,
    required this.status,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"] ?? 0,
    username: json["username"] ?? '',
    email: json["email"] ?? '',
    firstName: json["firstName"]?? '',
    lastName: json["lastName"] ?? '',
    gender: json["gender"] ?? '',
    image: json["image"] ?? '',
    status: json["status"] ?? false,
    message: json["message"] ?? '',
    token: json["token"] ??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "image": image,
    "token": token,
    "status": status,
    "message": message,
  };
}
