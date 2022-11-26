import 'package:flutter/foundation.dart' show immutable;

@immutable
class Constants {
  const Constants._();

  static const firebaseCollectionUsers = 'users';

  static const firebaseCollectionFavourites = 'favourites';

  static const firebaseCollectionFoodItems = 'food_items';
  static const firebaseCollectionCategories = 'categories';

  static const firebaseCollectionCart = 'cart';
  static const firebaseCollectionOrders = 'orders';
  static const firebaseCollectionRecentOrders = 'recent_orders';
}
