import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps/repositories/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

late Database _db;

List<Product> cartItems = [];
List<int> inCartIDs = [];

double total = 0.0;
final getStorage = GetStorage();

openDB() async {
  _db = await openDatabase(
    'nowapps_cart.db',
    version: 1,
    onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE Cart(id INT, name TEXT, price TEXT, quantity TEXT, image TEXT)");
    },
  );
  getCartItems();
}

void addProduct(Product product, int index) async {
  await addToCart(product, index);
  qtyChanger();

  Get.closeAllSnackbars();

  Get.snackbar(
    'Product Added',
    'You have added  to the cart',
    snackPosition: SnackPosition.BOTTOM,
  );
}

qtyChanger() async {
  total = 0.0;
  cartItems = await getCartItems();

  for (var element in cartItems) {
    inCartIDs.addIf(!inCartIDs.contains(element.id), element.id!);

    total += double.parse(element.price) * double.parse(element.quantity);
  }
  log('cart controlleril ulla cartItems ${cartItems.toString()}');
  log('cart controlleril ulla inCartID ${inCartIDs.toString()}');
}

Future<List<Product>> getCartItems() async {
  List<Product> productList = [];
  final values = await _db.rawQuery('SELECT * FROM Cart');

  //convert map to product object, and add to productList
  for (final value in values) {
    productList.add(
      Product.fromMap(value),
    );
  }
  log('cart values $values');
  return productList;
}

addToCart(Product product, int index) async {
  final id = await _db.rawQuery('SELECT id FROM Cart WHERE id = ?', [index]);

  if (id.isNotEmpty) {
    increseQty(index);
  } else {
    await _db.rawInsert(
        'INSERT INTO Cart(id, name, price, quantity, image) VALUES(?, ?, ?, ?, ?)',
        [
          product.id,
          product.name,
          product.price,
          product.quantity,
          product.image
        ]);
  }
}

increseQty(int productID) async {
  await _db.rawUpdate(
      'UPDATE Cart SET quantity = quantity + 1 WHERE id = ?', [productID]);
}

decreaseQty({required int productID}) async {
  final qty =
      await _db.rawQuery('SELECT quantity FROM Cart WHERE id = ?', [productID]);

  if (qty.isNotEmpty) {
    var qtyAsString = qty[0]["quantity"].toString();
    var qtyAsInt = int.tryParse(qtyAsString);
    if (qtyAsInt! > 1) {
      await _db.rawUpdate(
          'UPDATE Cart SET quantity = quantity - 1 WHERE id = ?', [productID]);
      log('inCartIDs $inCartIDs');
    } else {
      removeFromCart(productID);
    }
  }
}

removeFromCart(int productID) async {
  await _db.rawDelete('DELETE FROM Cart WHERE id = ?', [productID]);
  inCartIDs.removeWhere((element) => element == productID);
  log('inCartIDs $inCartIDs');
}

deleteCart() async {
  inCartIDs.clear();
  await _db.delete('Cart');
}
