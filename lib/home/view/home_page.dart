import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko/common_widget/button_widget.dart';
import 'package:teko/common_widget/label_widget.dart';
import 'package:teko/common_widget/product_list_widget.dart';
import 'package:teko/common_widget/product_submit_form_widget.dart';
import 'package:teko/home/bloc/home_bloc.dart';
import 'package:teko/home/bloc/home_state.dart';
import 'package:teko/repository/home_repository.dart';

import '../../model/ui_component_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is LoadedUIState) {
              return SingleChildScrollView(
                child: Column(
                  children: state.listUIComponents
                      .map((component) => buildUiComponent(component))
                      .toList(),
                ),
              );
            }

            if (state is CreateProductState) {

            }

            return const Text('No data available');
          },
        ),
      ),
    );
  }
}

Widget buildUiComponent(UiComponent component) {
  switch (component.type) {
    case "Label":
      return LabelWidget(text: component.customAttributes?.label?.text ?? '');
    case "ProductSubmitForm":
      return ProductSubmitForm(
          fields: component.customAttributes?.form ?? [],
          nameController: TextEditingController(),
          priceController: TextEditingController());
    case "Button":
      return CustomButton(
          text: component.customAttributes?.button?.text ?? 'Button');
    case "ProductList":
      return ProductListWidget(
          items: component.customAttributes?.productList?.items ?? []);
    default:
      return const SizedBox.shrink();
  }
}
