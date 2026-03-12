import 'package:travel_flutter/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.email,
    required super.role,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return UserModel(
      id: data['id'],
      firstName: data['firstName'],
      email: data['email'],
      role: data['role'],
      token: json['token'],
    );
  }
}

// class UserModel {
//   bool? success;
//   String? message;
//   String? token;
//   Data? data;

//   UserModel({this.success, this.message, this.token, this.data});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     token = json['token'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     data['message'] = message;
//     data['token'] = token;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? gender;
//   String? email;
//   String? countryCode;
//   String? dialCode;
//   String? mobileNo;
//   String? role;
//   String? address;
//   dynamic fcmToken;
//   dynamic deviceId;
//   String? lastUpdate;
//   String? profileImageUrl;

//   Data({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.gender,
//     this.email,
//     this.countryCode,
//     this.dialCode,
//     this.mobileNo,
//     this.role,
//     this.address,
//     this.fcmToken,
//     this.deviceId,
//     this.lastUpdate,
//     this.profileImageUrl,
//   });

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     gender = json['gender'];
//     email = json['email'];
//     countryCode = json['countryCode'];
//     dialCode = json['dialCode'];
//     mobileNo = json['mobileNo'];
//     role = json['role'];
//     address = json['address'];
//     fcmToken = json['fcmToken'];
//     deviceId = json['deviceId'];
//     lastUpdate = json['lastUpdate'];
//     profileImageUrl = json['profileImageUrl'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['firstName'] = firstName;
//     data['lastName'] = lastName;
//     data['gender'] = gender;
//     data['email'] = email;
//     data['countryCode'] = countryCode;
//     data['dialCode'] = dialCode;
//     data['mobileNo'] = mobileNo;
//     data['role'] = role;
//     data['address'] = address;
//     data['fcmToken'] = fcmToken;
//     data['deviceId'] = deviceId;
//     data['lastUpdate'] = lastUpdate;
//     data['profileImageUrl'] = profileImageUrl;
//     return data;
//   }
// }
