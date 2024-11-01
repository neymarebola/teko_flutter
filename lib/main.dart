import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko/app.dart';
import 'package:teko/observer/simple_bloc_observer.dart';
import 'package:teko/repository/home_repository.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(App(homeRepository: HomeRepository()));
}
