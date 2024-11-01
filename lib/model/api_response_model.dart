import 'package:teko/model/ui_component_model.dart';

class ApiResponse {
  final String? code;
  final String? message;
  final List<UiComponent>? data;

  ApiResponse({this.code, this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        code: json['code'] as String?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => UiComponent.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
