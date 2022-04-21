import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecipeService {
  Dio dio = Dio();
  requestRecipes(lastId) async {
    try {
      Response res;
      if (lastId.length == 0) {
        res = await dio
            .get('https://secure-beyond-98643.herokuapp.com/grabRecipes');
      } else {
        res = await dio.get(
            'https://secure-beyond-98643.herokuapp.com/grabRecipes',
            queryParameters: {"lastId": lastId});
      }

      return res.data;
      // dio.options.headers['Authorization'] = 'Bearer $token';
      // return await dio.get('https://secure-beyond-98643.herokuapp.com/getinfo');
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
