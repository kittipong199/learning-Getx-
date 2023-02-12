import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/controller/controller.dart';
import 'package:getxapp/page/cart.dart';

class ShoppingCartButton extends StatelessWidget {
  final AppController appController;

  const ShoppingCartButton({super.key, required this.appController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_sharp),
          onPressed: () {
            // navigate to cart page
            Get.to(
              () => CartPage(),
            );
          },
        ),
        Positioned(
          right: 1,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(32),
            ),
            // update item count in cart from app controller
            child: Obx(
              () => Text(
                appController.listCart.length.toString(),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
