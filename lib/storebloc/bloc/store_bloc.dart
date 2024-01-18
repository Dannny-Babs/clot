import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Clot/utils/store.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(const StoreState()) {
    on<StoreProductRequested>(_handleStoreProductRequested);
    on<StoreProductAddedCart>(_handleStoreProductAddedCart);
    on<StoreProductRemovedCart>(_handleStoreProductRemovedCart);
    on<StoreProductFavorite>(_handleStoreProductFavorite);
    on<StoreProductUnFavorite>(_handleStoreProductUnFavorite);
  }
  final StoreRepository api = StoreRepository();

  Future<void> _handleStoreProductRequested(
      StoreProductRequested event, Emitter<StoreState> emit) async {
    try {
      emit(
        state.copyWith(productStatus: StoreRequest.requestInProgress),
      );

      final response = await api.getProducts();
      emit(
        state.copyWith(
          productStatus: StoreRequest.requestSuccess,
          products: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(productStatus: StoreRequest.requestFailure));
    }
  }

  Future<void> _handleStoreProductAddedCart(
    StoreProductAddedCart event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        cartIds: {...state.cartIds, event.cartId},
      ),
    );
  }

  Future<void> _handleStoreProductRemovedCart(
    StoreProductRemovedCart event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        cartIds: {...state.cartIds}..remove(event.cartId),
      ),
    );
  }

  Future<void> _handleStoreProductFavorite(
    StoreProductFavorite event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        favoriteIds: {...state.favoriteIds, event.productId},
      ),
    );
  } 

  Future<void> _handleStoreProductUnFavorite(
    StoreProductUnFavorite event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        favoriteIds: {...state.favoriteIds}..remove(event.productId),
      ),
    );
  }
}


