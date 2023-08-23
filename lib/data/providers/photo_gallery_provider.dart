import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../network/endpoints.dart';
import '../../network/network_utils.dart';
import '../models/photo_model.dart';
import '../services/unsplash_api_service.dart';


class PhotoGalleryProvider with ChangeNotifier {
  List<UnsplashPhoto> _photos = [];
  int _currentPage = 1;
  final int _perPage = 30;
  bool _isLoading = false;
  String? _error;

  List<UnsplashPhoto> get photos => _photos;
  String? get error => _error;
  bool get isLoading => _isLoading;

  final _apiService = UnsplashApiService();

  Future<void> fetchPhotos() async {
    dynamic responseBody;

    try {
      if (_isLoading) {
        return;
      }
      _isLoading = true;

      responseBody = await _apiService.getPhotos(_currentPage, _perPage);

      if (responseBody != null) {
        final newPhotos = responseBody as List<dynamic>;

        // Convert the API response into UnsplashPhoto objects
        final List<UnsplashPhoto> parsedPhotos = newPhotos.map((photoJson) {
          return UnsplashPhoto.fromJson(photoJson);
        }).toList();

        _photos.addAll(parsedPhotos);
        _currentPage++;
        _error = null;
      } else {
        _error = 'An error occurred while fetching photos.';
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);

      print("================================");
      print(responseBody);
      print("================================");

      _error = 'An error occurred while fetching photos.';
      throw Exception('Failed to fetch photos');
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
