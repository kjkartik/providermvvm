import 'package:provider_mvvm/config/app_url.dart';
import 'package:provider_mvvm/data/network/base_api_service.dart';
import 'package:provider_mvvm/data/network/network_api_service.dart';
import 'package:provider_mvvm/repositery/auth_repository/login_repo.dart';

class AuthHttpApiRepository implements AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<dynamic> loginApi(dynamic data) async {
    print("log ${data}");

    dynamic response =
        await _apiService.postApiService(AppUrl.loginEndPint, data);
    return response;
  }
}
