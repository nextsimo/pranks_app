import 'package:cloud_firestore/cloud_firestore.dart';

List<TypeOfCallModel> typeofcallsFromDocuments(
        List<QueryDocumentSnapshot> map) =>
    List<TypeOfCallModel>.from(
        map.map((x) => TypeOfCallModel.fromMap(x.data())));

class TypeOfCallModel {
  final String id;
  final String label;
  final String emojis;
  final String video;
  final bool isLocked;
  final String audio;

  const TypeOfCallModel(
      {this.id,
      this.label,
      this.emojis,
      this.video,
      this.isLocked,
      this.audio});

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'label': this.label,
        'emojis': this.emojis,
        'video': this.video,
        'isLocked': this.isLocked,
        'audio': this.audio,
      };

  factory TypeOfCallModel.fromMap(Map<String, dynamic> json) => TypeOfCallModel(
        id: json['id'],
        label: json['label'],
        emojis: json['emojis'],
        isLocked: json['isLocked'],
        video: json['video'],
        audio: json['audio'],
      );
}
