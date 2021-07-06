import 'package:flutter/material.dart';
import 'package:loginapp/models/requests.dart';

class ListOfMatchesProvider with ChangeNotifier{

  List<Request> matches =[];

  addToMatches(Request req){
    matches.add(req);
    notifyListeners();
  }
}