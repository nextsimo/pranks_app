import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/wallpapers_model.dart';

class WallpapersService with ChangeNotifier {
  List<WallpapersModel> _papers = [];
  List<WallpapersModel> _popularsPapers = [];

  List<WallpapersModel> get popularsPapers => _popularsPapers;

  set popularsPapers(List<WallpapersModel> popularsPapers) {
    _popularsPapers = popularsPapers;
    notifyListeners();
  }

  List<WallpapersModel> get papers => _papers;

  set papers(List<WallpapersModel> papers) {
    _papers = papers;
    notifyListeners();
  }

  WallpapersService() {
    startListening();
    popularListning();
  }

  void popularListning() {
    FirebaseFirestore.instance
        .collection('wallpapers')
        .orderBy('createdDate')
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .listen((event) {
      popularsPapers = papersFromDocuments(event.docs);
    });
  }

  void startListening() {
    FirebaseFirestore.instance
        .collection('wallpapers')
        .orderBy('createdDate')
        .snapshots()
        .listen((event) {
      papers = papersFromDocuments(event.docs);
    });
  }
}
