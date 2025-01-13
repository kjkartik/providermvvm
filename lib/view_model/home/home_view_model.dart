import 'package:flutter/material.dart';
import '../../repositery/home_repositery/home_http_api_repository.dart';

class HomeViewModel with ChangeNotifier {
  final HomeHttpApiRepository homeRepo = HomeHttpApiRepository();

  bool _isLoading = false;
  dynamic _moviesList;

  bool get isLoading => _isLoading;
  dynamic get moviesList => _moviesList;

  Future<void> fetchMoviesList() async {
    _isLoading = true;
    notifyListeners(); // Notify UI that loading has started

    try {
      _moviesList = await homeRepo.getMoviesList();
    } catch (e) {
      // Handle errors here (log or update an error property)
      print('Error fetching movies: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI that loading has ended
    }
  }
}
