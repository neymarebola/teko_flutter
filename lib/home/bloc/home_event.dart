abstract class HomeEvent {}

class LoadingUIEvent extends HomeEvent {

}

class CreateProductEvent extends HomeEvent {}

class SetProductNameEvent extends HomeEvent {
  String name;
  SetProductNameEvent(this.name);
}

class SetPriceProductEvent extends HomeEvent {
  int price;
  SetPriceProductEvent(this.price);
}