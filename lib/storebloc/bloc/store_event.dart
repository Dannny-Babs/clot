abstract class StoreEvent {
  const StoreEvent();
}

class StoreProductRequested extends StoreEvent {}

class StoreProductAddedCart extends StoreEvent {
  final int cartId;

  const StoreProductAddedCart(this.cartId);
}

class StoreProductRemovedCart extends StoreEvent {
  final int cartId;

  const StoreProductRemovedCart(this.cartId);
}
