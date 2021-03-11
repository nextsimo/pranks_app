import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/type_of_call_model.dart';
import 'package:prank/src/models/wallpapers_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WallpapersService with ChangeNotifier {
  String emailPhone = '';
  String username = '';
  List<WallpapersModel> _papers = [];
  List<WallpapersModel> _popularsPapers = [];
  SharedPreferences prefs;
  List<String> _favorites = [];
  List<TypeOfCallModel> _typesOfcalls = [];

  List<TypeOfCallModel> get typesOfcalls => _typesOfcalls;

  set typesOfcalls(List<TypeOfCallModel> typesOfcalls) {
    _typesOfcalls = typesOfcalls;
    notifyListeners();
  }

  List<String> get favorites => _favorites;

  set favorites(List<String> favorites) {
    _favorites = favorites;
    notifyListeners();
  }

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
    init();
    startListening();
    popularListning();
    startListeningToTypeOfcalls();
  }

  void startListeningToTypeOfcalls() {
    FirebaseFirestore.instance
        .collection('call_types')
        .orderBy('sort')
        .snapshots()
        .listen((event) {
      typesOfcalls = typeofcallsFromDocuments(event.docs);
    });
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    fetchAllfavs();
  }

  void fetchAllfavs() {
    String res = prefs.getString('favs');
    if (res != null) {
      List<dynamic> myRes = json.decode(res);
      favorites = List<String>.from(myRes.map<String>((f) => f).toList());
    }
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

  void deleteFromFavorite(String image) {
    _favorites.remove(image);
    prefs.setString('favs', json.encode(_favorites));
    notifyListeners();
  }

  void addToFavorite(String image) {
    if (!_favorites.contains(image)) {
      _favorites.add(image);
      prefs.setString('favs', json.encode(_favorites));
      notifyListeners();
    } else {
      _favorites.remove(image);
      prefs.setString('favs', json.encode(_favorites));
      notifyListeners();
    }
  }
}
