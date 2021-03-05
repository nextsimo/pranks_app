import 'package:cloud_firestore/cloud_firestore.dart';

List<WallpapersModel> papersFromDocuments(List<QueryDocumentSnapshot> map) =>
    List<WallpapersModel>.from(
        map.map((x) => WallpapersModel.fromMap(x.data())));

class WallpapersModel {
  final String image;
  final String id;
  final bool isPopular;
  final String category;
  final DateTime createdDate;

  WallpapersModel(
      {this.id, this.image, this.createdDate, this.isPopular, this.category});

  factory WallpapersModel.fromMap(Map<String, dynamic> map) {
    return WallpapersModel(
      id: map['id'],
      image: map['image'],
      isPopular: map['isPopular'],
      createdDate: map['createdDate'].toDate(),
      category: map["category"],
    );
  }
}
