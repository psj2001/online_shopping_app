import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/cart model.dart';

//Define a  StateNotifierprovider to expose an instance  of the  CartNotifier
//Making it accessible within our app

final cartprovider =
    StateNotifierProvider<CartNotifier, Map<String, Cart>>((ref) {
  return CartNotifier();
});

// A Notifier class to manage the cart state, extending StateNotifier
// with an initial state of an empty map

class CartNotifier extends StateNotifier<Map<String, Cart>> {
  CartNotifier() : super({});

  // Method to add product to the cart

  void addProductToCart({
    required String productName,
    required int productPrice,
    required String category,
    required List<String> image,
    required String vendorId,
    required int productQuantity,
    required int quantity,
    required String productId,
    required String description,
    required String fullName,
  }) {

    // Check if product is already in the cart
    if (state.containsKey(productId)) {
      //if the product is already in the cart , update its quantity and maybe other details
      
      state = {
        ...state,
        productId: Cart(
          productName: state[productId]!.productName,
          productPrice: state[productId]!.productPrice,
          category: state[productId]!.category,
          image: state[productId]!.image,
          vendorId: state[productId]!.vendorId,
          productQuantity: state[productId]!.productQuantity,
          Quantity: state[productId]!.Quantity + 1,
          productId: state[productId]!.productId,
          description: state[productId]!.description,
          fullName: state[productId]!.fullName,
        )
      };
    } else {
      // if the product is not in the cart , add it with  the  provided  details
      state = {
        ...state,
        productId: Cart(
            productName: productName,
            productPrice: productPrice,
            category: category,
            image: image,
            vendorId: vendorId,
            productQuantity: productQuantity,
            Quantity: quantity,
            productId: productId,
            description: description,
            fullName: fullName)
      };
    }
  }

  //Method to increment the product quantity in the app
  void IncrementCartItem(String productId) {
    if (state.containsKey(productId)) {
      state[productId]!.Quantity++;

      //Notify listeners that the  state  has changed
      state = {...state};
    }
  }

  //Method to increment the product quantity in the app
  void decrimentCartItem(String productId) {
    if (state.containsKey(productId)) {
      state[productId]!.Quantity--;

      //Notify listeners that the  state  has changed
      state = {...state};
    }
  }

  // Method to remove the item from the cart
  void removeCartItem(String productId) {
    state.remove(productId);
  }

  // Method to calculate total amount of item  we have in the cart
  double calculateTotalAmount() {
    double totalamount = 0.0;
    state.forEach((productId, cartItem) {
      totalamount += cartItem.Quantity * cartItem.productPrice;
    });
    return totalamount;
  }
}
