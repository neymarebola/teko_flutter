import 'package:teko/model/custom_attributes_model.dart';

class UiComponent {
  final String? type;
  final CustomAttributes? customAttributes;

  UiComponent({this.type, this.customAttributes});

  factory UiComponent.fromJson(Map<String, dynamic> json) => UiComponent(
        type: json['type'] as String?,
        customAttributes: json['customAttributes'] != null
            ? CustomAttributes.fromJson(
                json['customAttributes'] as Map<String, dynamic>)
            : null,
      );
}
