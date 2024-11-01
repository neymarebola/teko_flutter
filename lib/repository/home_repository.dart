import 'package:dio/dio.dart';
import 'package:teko/common/constants.dart';
import 'package:teko/model/api_response_model.dart';
import 'package:teko/model/ui_component_model.dart';

class HomeRepository {
  final dio = Dio();

  Future<List<UiComponent>> fetchAPI() async {
    try {
      var response = await dio.get(Constants.API_ENDPOINT);

      var jsonData = response.data;

      ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      List<UiComponent> UIComponents = apiResponse.data ?? [];

      return UIComponents;
    } on DioException catch (e) {
      // Handle the error and print the response data for better debugging
      print('Error: ${e.response?.data}');
      return [];
    }
  }
}
