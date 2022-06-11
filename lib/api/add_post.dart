import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPostApi {
  static uploadImage(XFile image, String caption) async {
    const String mainUrl = "http://159.89.161.168:4050";

    String filePath = image.path;
    String fileName = image.name;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("auth-token").toString();
    String userId = prefs.getString("user_id").toString();

    Map<String, dynamic> map = {"status": 500, "message": "failed to post"};
    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(filePath, filename: fileName),
      });
      Response response = await Dio().post(mainUrl + '/api/posts/upload-img',
          data: formData, options: Options(headers: {"auth-token": token}));
      print("file upload response $response");
      print(response.statusCode);
      map = {
        "status": response.statusCode,
        "message": response.data["message"]
      };
    } catch (error) {
      print("error");
    }
    return map;
  }
}
