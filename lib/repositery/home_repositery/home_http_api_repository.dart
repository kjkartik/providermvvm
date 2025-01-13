 import 'package:provider_mvvm/config/app_url.dart';
import 'package:provider_mvvm/data/network/base_api_service.dart';
import 'package:provider_mvvm/data/network/network_api_service.dart';

import 'home_repo.dart';

class HomeHttpApiRepository implements HomeRepo {
  
  final BaseApiService _apiService= NetworkApiService();
  
  @override
  Future getMoviesList()async {
 dynamic response = await _apiService.getApiService(AppUrl.moviesBaseUrl);
 return response;
  }
}

