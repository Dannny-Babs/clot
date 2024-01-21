import 'package:clot/utils/store.dart';

enum StoreRequest { unknown, requestInProgress, requestSuccess, requestFailure }

class StoreState {
  const StoreState({
    this.products = const [],
    required this.tabIndex,
    this.productStatus = StoreRequest.unknown,
    this.cartIds = const {},
    this.favoriteIds = const {},
  });

  final int tabIndex;
  final List<Product> products;
  final StoreRequest productStatus;
  final Set<int> cartIds;
  final Set<int> favoriteIds;

  StoreState copyWith({
    List<Product>? products,
    StoreRequest? productStatus,
    Set<int>? cartIds,
    Set<int>? favoriteIds,
    int? tabIndex,
  }) {
    return StoreState(
      products: products ?? this.products,
      productStatus: productStatus ?? this.productStatus,
      cartIds: cartIds ?? this.cartIds,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }
}

class StorePageState extends StoreState {
  const StorePageState({required super.tabIndex});
}
