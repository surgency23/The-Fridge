import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = Dio();
  login(email, password) async {
    try {
      return await dio.post(
          "https://secure-beyond-98643.herokuapp.com/authenticate",
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  addUser(email, password, fridgeName) async {
    try {
      return await dio.post("https://secure-beyond-98643.herokuapp.com/signup",
          data: {
            "email": email,
            "password": password,
            "fridgeName": fridgeName
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  getinfo(token) async {
    try {
      return await dio.get('https://secure-beyond-98643.herokuapp.com/getinfo',
          options: Options(headers: {"Authorization": token}));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
