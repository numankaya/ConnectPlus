import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectPlusUserUser {
  final String uId;
  final String fullName;
  final String? mail;
  final String? phone;
  final bool isMailVerified;
  const ConnectPlusUserUser({
    required this.uId,
    required this.fullName,
    required this.mail,
    required this.phone,
    required this.isMailVerified,
  });

  ConnectPlusUserUser copyWith({
    String? uId,
    String? fullName,
    String? mail,
    String? phone,
    bool? isMailVerified,
  }) {
    return ConnectPlusUserUser(
      uId: uId ?? this.uId,
      fullName: fullName ?? this.fullName,
      mail: mail ?? this.mail,
      phone: phone ?? this.phone,
      isMailVerified: isMailVerified ?? this.isMailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uId': uId});
    result.addAll({'fullName': fullName});
    result.addAll({'mail': mail});
    result.addAll({'phone': phone});
    result.addAll({'isMailVerified': isMailVerified});
  
    return result;
  }

  factory ConnectPlusUserUser.fromMap(Map<String, dynamic> map) {
    return ConnectPlusUserUser(
      uId: map['uId'] ?? '',
      fullName: map['fullName'] ?? '',
      mail: map['mail'] ?? '',
      phone: map['phone'] ?? '',
      isMailVerified: map['isMailVerified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConnectPlusUserUser.fromJson(String source) => ConnectPlusUserUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uId: $uId, fullName: $fullName, mail: $mail, phone: $phone, isMailVerified: $isMailVerified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ConnectPlusUserUser &&
      other.uId == uId &&
      other.fullName == fullName &&
      other.mail == mail &&
      other.phone == phone &&
      other.isMailVerified == isMailVerified;
  }

  @override
  int get hashCode {
    return uId.hashCode ^
      fullName.hashCode ^
      mail.hashCode ^
      phone.hashCode ^
      isMailVerified.hashCode;
  }
}

class UserNotifier extends StateNotifier<ConnectPlusUserUser> {
  UserNotifier(super.state);

  void LogOut() {
    state = ConnectPlusUserUser(uId: "", fullName: "", mail: "", phone: "", isMailVerified: false);
  }

  void ChangeUser(ConnectPlusUserUser x) {
    state = x;
  }

  void updateMailStatus(bool x) {
    state = state.copyWith(isMailVerified: x);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, ConnectPlusUserUser>((ref) => UserNotifier(ConnectPlusUserUser(uId: "", fullName: "", mail: "", phone: "", isMailVerified: false)));

/*
class User {
  final String uId;
  final String fullName;
  final String mail;
  final String phone;
  final bool isMailVerified;
  final bool isPhoneVerified;
  const User({required this.uId, required this.fullName, required this.mail, required this.phone, required this.isMailVerified, required this.isPhoneVerified});
}
*/