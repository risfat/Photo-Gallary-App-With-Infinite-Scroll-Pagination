
import '../utils/app_mode.dart';

class API {
  static const STAGING_BASE_URL = 'https://api.unsplash.com/';
  static const LIVE_BASE_URL = 'https://api.unsplash.com/';
  static const BASE_URL = AppMode.PRODUCTION_MODE ? LIVE_BASE_URL : STAGING_BASE_URL;

  /// Get List of Images
  static getImages(page, perPage) => 'photos?page=$page&per_page=$perPage';

}
