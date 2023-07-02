import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/*class ConnectPlusUser {
  final String uId;
  final String? fullName;
  final String? nickName;
  final String? mail;
  final String? phone;
  final String? country;
  final String? gender;
  final String? address1;
  final String? address2;
  final bool isMailVerified;
  const ConnectPlusUser({
    required this.uId,
    required this.fullName,
    required this.nickName,
    required this.mail,
    required this.phone,
    required this.country,
    required this.gender,
    required this.address1,
    required this.address2,
    required this.isMailVerified,
  });

  ConnectPlusUser copyWith({
    String? uId,
    String? fullName,
    String? nickName,
    String? mail,
    String? phone,
    String? country,
    String? gender,
    String? address1,
    String? address2,
    bool? isMailVerified,
  }) {
    return ConnectPlusUser(
      uId: uId ?? this.uId,
      fullName: fullName ?? this.fullName,
      nickName: nickName ?? this.nickName,
      mail: mail ?? this.mail,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      isMailVerified: isMailVerified ?? this.isMailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uId': uId});
    result.addAll({'fullName': fullName});
    result.addAll({'nickName': nickName});
    result.addAll({'mail': mail});
    result.addAll({'phone': phone});
    result.addAll({'country': country});
    result.addAll({'gender': gender});
    result.addAll({'address1': address1});
    result.addAll({'address2': address2});
    result.addAll({'isMailVerified': isMailVerified});
  
    return result;
  }

  factory ConnectPlusUser.fromMap(Map<String, dynamic> map) {
    return ConnectPlusUser(
      uId: map['uId'] ?? '',
      fullName: map['fullName'] ?? '',
      nickName: map['nickName'] ?? '',
      mail: map['mail'] ?? '',
      phone: map['phone'] ?? '',
      country: map['country'] ?? '',
      gender: map['gender'] ?? '',
      address1: map['address1'] ?? '',
      address2: map['address2'] ?? '',
      isMailVerified: map['isMailVerified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConnectPlusUser.fromJson(String source) => ConnectPlusUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uId: $uId, fullName: $fullName, nickName: $nickName, mail: $mail, phone: $phone, country: $country, gender: $gender, address1: $address1, address2: $address2, isMailVerified: $isMailVerified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ConnectPlusUser &&
      other.uId == uId &&
      other.fullName == fullName &&
      other.nickName == nickName &&
      other.mail == mail &&
      other.phone == phone &&
      other.country == country &&
      other.gender == gender &&
      other.address1 == address1 &&
      other.address2 == address2 &&
      other.isMailVerified == isMailVerified;
  }

  @override
  int get hashCode {
    return uId.hashCode ^
      fullName.hashCode ^
      nickName.hashCode ^
      mail.hashCode ^
      phone.hashCode ^
      country.hashCode ^
      gender.hashCode ^
      address1.hashCode ^
      address2.hashCode ^
      isMailVerified.hashCode;
  }
}

class UserNotifier extends StateNotifier<ConnectPlusUser> {
  UserNotifier(super.state);

  void LogOut() {
    state = ConnectPlusUser(uId: "", fullName: "", nickName: "", mail: "", phone: "", country: "", gender: "", isMailVerified: false, address1: '', address2:  "");
  }

  void ChangeUser(ConnectPlusUser x) {
    state = x;
  }

  void updateMailStatus(bool x) {
    state = state.copyWith(isMailVerified: x);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, ConnectPlusUser>((ref) => UserNotifier(ConnectPlusUser(uId: "", fullName: "", nickName: "", mail: "", phone: "", country: "", gender: "", isMailVerified: false, address1: '', address2: "")));
*/

class ConnectPlusUser {
  final String uId;
  final String? fullName;
  final String? nickName;
  final String? mail;
  final String? phone;
  final String? type;
  final String? gender;
  final String? address;
  final String? school;
  final String? erasmusSchool;
  final bool isMailVerified;
  ConnectPlusUser({
    required this.uId,
    required this.fullName,
    required this.nickName,
    required this.mail,
    required this.phone,
    required this.type,
    required this.gender,
    required this.address,
    required this.school,
    required this.erasmusSchool,
    required this.isMailVerified,
  });

  ConnectPlusUser copyWith({
    String? uId,
    String? fullName,
    String? nickName,
    String? mail,
    String? phone,
    String? type,
    String? gender,
    String? address,
    String? school,
    String? erasmusSchool,
    bool? isMailVerified,
  }) {
    return ConnectPlusUser(
      uId: uId ?? this.uId,
      fullName: fullName ?? this.fullName,
      nickName: nickName ?? this.nickName,
      mail: mail ?? this.mail,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      school: school ?? this.school,
      erasmusSchool: erasmusSchool ?? this.erasmusSchool,
      isMailVerified: isMailVerified ?? this.isMailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uId': uId});
    if (fullName != null) {
      result.addAll({'fullName': fullName});
    }
    if (nickName != null) {
      result.addAll({'nickName': nickName});
    }
    if (mail != null) {
      result.addAll({'mail': mail});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (school != null) {
      result.addAll({'school': school});
    }
    if (erasmusSchool != null) {
      result.addAll({'erasmusSchool': erasmusSchool});
    }
    result.addAll({'isMailVerified': isMailVerified});

    return result;
  }

  factory ConnectPlusUser.fromMap(Map<String, dynamic> map) {
    return ConnectPlusUser(
      uId: map['uId'] ?? '',
      fullName: map['fullName'],
      nickName: map['nickName'],
      mail: map['mail'],
      phone: map['phone'],
      type: map['type'],
      gender: map['gender'],
      address: map['address'],
      school: map['school'],
      erasmusSchool: map['erasmusSchool'],
      isMailVerified: map['isMailVerified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConnectPlusUser.fromJson(String source) =>
      ConnectPlusUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConnectPlusUser(uId: $uId, fullName: $fullName, nickName: $nickName, mail: $mail, phone: $phone, type: $type, gender: $gender, address: $address, school: $school, erasmusSchool: $erasmusSchool, isMailVerified: $isMailVerified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConnectPlusUser &&
        other.uId == uId &&
        other.fullName == fullName &&
        other.nickName == nickName &&
        other.mail == mail &&
        other.phone == phone &&
        other.type == type &&
        other.gender == gender &&
        other.address == address &&
        other.school == school &&
        other.erasmusSchool == erasmusSchool &&
        other.isMailVerified == isMailVerified;
  }

  @override
  int get hashCode {
    return uId.hashCode ^
        fullName.hashCode ^
        nickName.hashCode ^
        mail.hashCode ^
        phone.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        address.hashCode ^
        school.hashCode ^
        erasmusSchool.hashCode ^
        isMailVerified.hashCode;
  }
}

class UserNotifier extends StateNotifier<ConnectPlusUser> {
  UserNotifier(super.state);

  void LogOut() {
    state = ConnectPlusUser(
      uId: "",
      fullName: "",
      nickName: "",
      mail: "",
      phone: "",
      gender: "",
      isMailVerified: false,
      address: '',
      type: '',
      school: '',
      erasmusSchool: '',
    );
  }

  void ChangeUser(ConnectPlusUser x) {
    state = x;
  }

  void updateMailStatus(bool x) {
    state = state.copyWith(isMailVerified: x);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, ConnectPlusUser>(
    (ref) => UserNotifier(ConnectPlusUser(
        uId: "",
        fullName: "",
        nickName: "",
        mail: "",
        phone: "",
        gender: "",
        isMailVerified: false,
        address: '',
        type: '',
        school: '',
        erasmusSchool: '')));

/*
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
*/