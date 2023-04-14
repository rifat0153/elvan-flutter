import 'package:elvan_shared/domain_models/cart/cart.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_ui_state.freezed.dart';

@freezed
class CartUiState with _$CartUiState {
  const CartUiState._();

  const factory CartUiState.loading() = _CartState_Loading;
  const factory CartUiState.empty() = _CartState_Empty;
  const factory CartUiState.data(Cart cart) = _CartState_Loaded;
  const factory CartUiState.error(String message, {StackTrace? st}) =
      _CartState_Error;

  bool get isEmpty => maybeWhen(
        empty: () => true,
        orElse: () => false,
      );

  bool get isData => maybeWhen(
        data: (cart) => true,
        orElse: () => false,
      );

  List<CartItem>? get cartItems => maybeWhen(
        data: (cart) => cart.cartItems,
        orElse: () => null,
      );

  Cart? get value => maybeWhen(
        data: (cart) => cart,
        orElse: () => null,
      );
}
