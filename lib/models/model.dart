// To parse this JSON data, do
//
//     final userReqIdModel = userReqIdModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserReqIdModel userReqIdModelFromJson(String str) => UserReqIdModel.fromJson(json.decode(str));

String userReqIdModelToJson(UserReqIdModel data) => json.encode(data.toJson());

class UserReqIdModel {
  int? count;
  String msg;
  Data data;
  int? teamMood;
  List<Moodalytic> moodalytics;
  int? responseCode;

  UserReqIdModel({
    required this.count,
    required this.msg,
    required this.data,
    required this.teamMood,
    required this.moodalytics,
    required this.responseCode,
  });

  factory UserReqIdModel.fromJson(Map<String, dynamic> json) => UserReqIdModel(
    count: json["count"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
    teamMood: json["team_mood"],
    moodalytics: List<Moodalytic>.from(json["moodalytics"].map((x) => Moodalytic.fromJson(x))),
    responseCode: json["response_code"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "msg": msg,
    "data": data.toJson(),
    "team_mood": teamMood,
    "moodalytics": List<dynamic>.from(moodalytics.map((x) => x.toJson())),
    "response_code": responseCode,
  };
}

class Data {
  dynamic managerId;
  String description;
  dynamic emojiPoint;
  dynamic userProfile;
  dynamic reasonType;

  Data({
    required this.managerId,
    required this.description,
    required this.emojiPoint,
    required this.userProfile,
    required this.reasonType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    managerId: json["manager_id"],
    description: json["description"],
    emojiPoint: json["emoji_point"],
    userProfile: json["user_profile"],
    reasonType: json["reason_type"],
  );

  Map<String, dynamic> toJson() => {
    "manager_id": managerId,
    "description": description,
    "emoji_point": emojiPoint,
    "user_profile": userProfile,
    "reason_type": reasonType,
  };
}

class Moodalytic {
  int? id;
  String createdAt;
  DateTime updatedAt;
  int? userProfileId;
  int? reasonTypeId;
  int? managerId;
  String description;
  int? emojiPoint;

  Moodalytic({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userProfileId,
    required this.reasonTypeId,
    required this.managerId,
    required this.description,
    required this.emojiPoint,
  });

  factory Moodalytic.fromJson(Map<String, dynamic> json) => Moodalytic(
    id: json["id"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    userProfileId: json["user_profile_id"],
    reasonTypeId: json["reason_type_id"],
    managerId: json["manager_id"],
    description: json["description"],
    emojiPoint: json["emoji_point"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
    "user_profile_id": userProfileId,
    "reason_type_id": reasonTypeId,
    "manager_id": managerId,
    "description": description,
    "emoji_point": emojiPoint,
  };
}
