import 'package:flutter/cupertino.dart';
import 'package:provider_mvvm/repositery/auth_repository/login_repo.dart';
import '../../repositery/auth_repository/auth_http_api_repository.dart';
import '../../repositery/home_repositery/home_http_api_repository.dart';

class LoginViewModel with ChangeNotifier {
  late AuthRepository authRepository  = AuthHttpApiRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

    Future<dynamic> login(dynamic data) async {

    try {
      _setLoading(true);

      final response = await authRepository.loginApi(data);

      _setLoading(false);
      return response;
    } catch (e) {
      _setLoading(false);
      rethrow;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
