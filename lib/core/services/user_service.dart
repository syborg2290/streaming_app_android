import 'package:android_app/core/constants/backend_constants.dart';
import 'package:android_app/core/models/response.dart';
import 'package:android_app/core/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static final UserService _userService = UserService._init();
  final String baseUri = BackendConstants.API_URL + '/auth';

  factory UserService() {
    return _userService;
  }

  UserService._init();

  Future<Response> addUser(User user) async {
    final request = await http.post(Uri.parse(baseUri + '/register'),
        body: jsonEncode(user.toJson()), headers: BackendConstants.HEADERS);
    Response response = Response();
    try {
      if (request.statusCode == 200) {
        response = responseFromJson(request.body);
      } else {
        return Response();
      }
    } catch (e) {
      return Response();
    }
    return response;
  }
}
