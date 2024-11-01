import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko/home/bloc/home_bloc.dart';
import 'package:teko/home/bloc/home_event.dart';
import 'package:teko/home/bloc/home_state.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {

      return ElevatedButton(
        onPressed: () {
          context
              .read<HomeBloc>()
              .add(CreateProductEvent());
        },
        child: Text(text),
      );
    });
  }
}
