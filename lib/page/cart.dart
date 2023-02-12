import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/controller/controller.dart';

import '../data_list/data_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

// final AppController appController = Get.find<AppController>();

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
        ),
        body: GetBuilder<AppController>(
          init: AppController(),
          builder: (appController) => (appController.listCart.isNotEmpty) // แช็ค controller  ว่าไม่ว่างไหม 
              ? CartListItem(appController: appController)// ถ้าไม่ว่าง ให้โช สินค้า
              : const Center(
                  child: Text("ไม่มีสินค้า"), //ถ้าว่าง ให้ แสดง ไม่มีสินค้า

                ),
        ));
  }
}

class CartListItem extends StatelessWidget {
  CartListItem({Key? key, required this.appController}) : super(key: key);

  AppController appController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Column(
              children: appController.listCart.map((e) {
                return ListTile(
                  title: Text(listProduct
                      .where((element) => element.id == e.productId)
                      .first
                      .title),
                  subtitle: Text('X ${e.quantity}'),
                  trailing: ElevatedButton(
                    child: const Text("Remove"),
                    onPressed: () {
                      // remove item at index from cart
                      appController.listCart.removeAt(
                        appController.listCart.indexOf(e),
                      );
                      appController.update();
                    },
                  ),
                );
              }).toList(),
            ),

            // total price
            const Divider(
              thickness: 2.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // total item
                  Text(
                    'Total: ${appController.listCart.map((e) => e.quantity).reduce((a, b) => a + b)}',
                    style: const TextStyle(fontSize: 18.0),
                  ),

                  // total price
                  Text(
                    'Price: \$${appController.listCart.map((e) => e.quantity * listProduct.where((element) => element.id == e.productId).first.price).reduce((a, b) => a + b)}',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2.0,
            ),

            // proceed to checkout button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              width: constraints.maxWidth,
              child: ElevatedButton(
                  onPressed: () {
                    // proceess to checkout
                  },
                  child: const Text("Checkout")),
            ),
          ],
        );
      }),
    );
  }
}
