import 'package:get/get.dart';
import 'package:getxapp/model/cart_model.dart';

class AppController extends GetxController {
  // ดึงตัว model cart มาใช้
  RxList<Cart> listCart = <Cart>[].obs;

  addItemToCart(Cart cart) {
    // เรียก model Cart มา
    // chaek listCart ว่า มี productId  == cart ที่ มา จาก Model cart productId ไหม
    if (listCart.where((e) => e.productId == cart.productId).isEmpty) {
        // ถ้าไม่ตรงกัน ให้ แอดเพิ่มเข้ามา
      listCart.add(cart);
    } else {
    

       // ถ้า ตรงกัน ให้ เพิ่ม ค่า +1
      listCart.value
          .firstWhere((e) => e.productId == cart.productId)
          .quantity++;
    }

    update();
  }
}
