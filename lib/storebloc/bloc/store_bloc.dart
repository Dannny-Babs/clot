import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Clot/utils/store.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(const StoreState()) {
    on<StoreProductRequested>((event, emit) {
      // TODO: implement event handler
    });
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
}
