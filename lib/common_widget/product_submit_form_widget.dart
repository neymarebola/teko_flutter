import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teko/common/helper.dart';
import 'package:teko/home/bloc/home_bloc.dart';
import 'package:teko/home/bloc/home_event.dart';
import 'package:teko/home/bloc/home_state.dart';
import 'package:teko/model/custom_form.dart';

class ProductSubmitForm extends StatelessWidget {
  final List<CustomForm> fields;
  final TextEditingController nameController;
  final TextEditingController priceController;

  ProductSubmitForm({required this.fields, required this.nameController,required this.priceController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is ValidateInputState) {

      }

      if (state is CreateProductState) {
        context
            .read<HomeBloc>()
            .add(SetProductNameEvent(nameController.text));
        context
            .read<HomeBloc>()
            .add(SetPriceProductEvent(priceController.text as int));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: fields.map((field) => buildFormField(field)).toList(),
      );
    });
  }

  Widget buildFormField(CustomForm form) {
    switch (form.type) {
      case 'text':
        return TextFormField(
          controller: nameController,
          decoration: InputDecoration(labelText: form.label),
          maxLength: form.maxLength,
        );
      case 'number':
        return TextFormField(
          controller: priceController,
          decoration: InputDecoration(labelText: form.label),
          keyboardType: TextInputType.number,
        );
      case 'file_upload':
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: const Text('Ảnh sản phẩm'),
            ),
            ElevatedButton(
              onPressed: () {
                // Xử lý tải file lên
              },
              child: Text('Chọn tệp tin'),
            ),
          ],
        );
      default:
        return SizedBox.shrink();
    }
  }
}
