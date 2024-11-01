import 'package:teko/model/ui_component_model.dart';

abstract class HomeState {}

class InitialState extends HomeState {}

class LoadedUIState extends HomeState {
  final List<UiComponent> listUIComponents;

  LoadedUIState(this.listUIComponents);

}

class CreateProductState extends HomeState {

}

class ValidateInputState extends HomeState {}

class SetProductNameState extends HomeState {
  String name;
  SetProductNameState(this.name);
}

class SetProductPriceState extends HomeState {
  int price;
  SetProductPriceState(this.price);
}

