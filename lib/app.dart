import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko/home/bloc/home_bloc.dart';
import 'package:teko/home/bloc/home_event.dart';
import 'package:teko/home/view/home_page.dart';
import 'package:teko/repository/home_repository.dart';

class App extends StatelessWidget {
  const App({required this.homeRepository, super.key});

  final HomeRepository homeRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(homeRepository: homeRepository)..add(LoadingUIEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Bloc Shopping Cart',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        // theme: ThemeData(
        //   dividerColor: Colors.transparent,
        // ),
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(),
          //  '/cart': (_) => const CartPage(),
        },
      ),
    );
  }
}
