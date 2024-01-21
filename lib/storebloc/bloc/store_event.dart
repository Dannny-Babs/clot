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

class StoreProductFavorite extends StoreEvent {
  final int productId;

  const StoreProductFavorite(this.productId);
}

class StoreProductUnFavorite extends StoreEvent {
  final int productId;

  const StoreProductUnFavorite(this.productId);
}


class TabChange extends StoreEvent {
  final int tabIndex;

 const TabChange({required this.tabIndex});
}
