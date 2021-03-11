import 'package:cloud_firestore/cloud_firestore.dart';

List<AdsModel> adsModelFromDocuments(List<QueryDocumentSnapshot> map) =>
    List<AdsModel>.from(map.map((x) => AdsModel.fromMap(x.data())));

class AdsModel {
  AdsModel({
    this.id,
    this.androidToken,
    this.iosToken,
    this.type,
    this.company,
    this.token,
  });

  final String id;
  final String androidToken;
  final String iosToken;
  final String type;
  final String company;
  final String token;

  factory AdsModel.fromMap(Map<String, dynamic> json) => AdsModel(
        id: json["id"],
        androidToken: json["android_token"],
        iosToken: json["ios_token"],
        type: json["type"],
        company: json["company"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "android_token": androidToken,
        "ios_token": iosToken,
        "type": type,
        "company": company,
        "token": token,
      };
}
