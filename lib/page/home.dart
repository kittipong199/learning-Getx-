import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/controller/controller.dart';
import 'package:getxapp/data_list/data_list.dart';
import 'package:getxapp/model/product.dart';
import 'package:getxapp/model/cart_model.dart';
import 'package:getxapp/page/product_details.dart';
import 'package:getxapp/widget/result.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ส่วน ของ AppBar
      appBar: AppBar(
        title: const Text("E-Commerce"),
        actions: [

          // ไปเรียก widget buttom ที่หน้า result มาใช้ 
          ShoppingCartButton(appController: appController)
        ],
      ),

      // ส่วนของ body
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: listProduct.length,
        itemBuilder: (BuildContext context, int index) {
          return LayoutBuilder(builder: (context, constraints) {
            return InkWell(
              onTap: () {
                //   navigate to product detail page
                Get.to(
                  () => ProductDetailsPage(
                    product: listProduct[index],
                  ),
                );
                
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // image
                    Image.network(listProduct[index].image, width: constraints.maxWidth, height: constraints.maxHeight * 0.75,),
                    // SizedBox(
                    //   width: constraints.maxWidth,
                    //   height: constraints.maxHeight * 0.75,
                    //   child: Placeholder(
                      
                    //     color: Colors.grey.shade300,
                        
                    //   ),
                      
                    // ),
                    // product name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        listProduct[index].title,
                        //  '${appController.listCart.value.length}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    // product price
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('\$${listProduct[index].price}'),
                    ),
                    // space
                    const SizedBox(height: 8.0)
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
