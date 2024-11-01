import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teko/home/bloc/home_event.dart';
import 'package:teko/home/bloc/home_state.dart';
import 'package:teko/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(InitialState()) {
    on<LoadingUIEvent>(_onLoadingUI);
    on<CreateProductEvent>(_onCreateProduct);
    on<SetPriceProductEvent>(_onSetProductPriceEvent);
    on<SetProductNameEvent>(_onSetProductNameEvent);
  }

  final HomeRepository homeRepository;

  Future<void> _onLoadingUI(
    LoadingUIEvent event,
    Emitter<HomeState> emit,
  ) async {

    final listUIComponents = await homeRepository.fetchAPI();
    print('data: $listUIComponents');
    emit(LoadedUIState(listUIComponents));
  }

  Future<void> _onCreateProduct(
      CreateProductEvent event,
      Emitter<HomeState> emit,
      ) async {

    emit(ValidateInputState());

  }

  Future<void> _onSetProductNameEvent(
      SetProductNameEvent event,
      Emitter<HomeState> emit,
      ) async {

    emit((SetProductNameState(event.name)));

  }

  Future<void> _onSetProductPriceEvent(
      SetPriceProductEvent event,
      Emitter<HomeState> emit,
      ) async {

    emit((SetProductPriceState(event.price)));

  }

}
