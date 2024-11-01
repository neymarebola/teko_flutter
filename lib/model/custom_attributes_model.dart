import 'package:teko/model/button_model.dart';
import 'package:teko/model/custom_form.dart';
import 'package:teko/model/label_model.dart';
import 'package:teko/model/product_list_model.dart';

class CustomAttributes {
  final Label? label;
  final List<CustomForm>? form;
  final Button? button;
  final ProductList? productList;

  CustomAttributes({this.label, this.form, this.button, this.productList});

  factory CustomAttributes.fromJson(Map<String, dynamic> json) =>
      CustomAttributes(
        label: json['label'] != null
            ? Label.fromJson(json['label'] as Map<String, dynamic>)
            : null,
        form: (json['form'] as List<dynamic>?)
            ?.map((e) => CustomForm.fromJson(e as Map<String, dynamic>))
            .toList(),
        button: json['button'] != null
            ? Button.fromJson(json['button'] as Map<String, dynamic>)
            : null,
        productList: json['productlist'] != null
            ? ProductList.fromJson(json['productlist'] as Map<String, dynamic>)
            : null,
      );
}
