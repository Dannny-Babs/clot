import 'package:Clot/utils/store.dart';

enum StoreRequest { 
  unknown,
  requestInProgress,
  requestSuccess,
  requestFailure
 }

class StoreState {
  const StoreState({
    this.products = const [],
    this.productStatus = StoreRequest.unknown,
    this.cartIds = const {},
  });

  final List<Product> products;
  final StoreRequest productStatus;
  final Set<int> cartIds;

  StoreState copyWith({
    List<Product>? products,
    StoreRequest? productStatus,
    Set<int>? cartIds,
  }) {
    return StoreState(
      products: products ?? this.products,
      productStatus: productStatus ?? this.productStatus,
      cartIds: cartIds ?? this.cartIds,
    );
  }
}
