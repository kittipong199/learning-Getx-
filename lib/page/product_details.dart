// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getxapp/controller/controller.dart';
import 'package:getxapp/data_list/data_list.dart';
import 'package:getxapp/model/product.dart';
import 'package:getxapp/widget/result.dart';

import 'package:getxapp/model/cart_model.dart';



class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  // เรียก controller มาใช้ 
  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
        actions: [
          // shopping cart icon button widget
          ShoppingCartButton(appController: appController)
        ],
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                Image.network(listProduct[1].image),
              

                // title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${product.price}'),
                ),

                // description
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${product.description}'),
                ),

                // add to cart button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO : add product to cart
                        appController.addItemToCart(
                          Cart(
                            productId: product.id,
                            quantity: 1,
                          ),
                        );
                      },
                      child: const Text("Add to cart"),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
