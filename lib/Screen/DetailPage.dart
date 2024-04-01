import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_app/utils/product.dart';

class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argu =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f1f8),
        centerTitle: true,
        title: Text(
          "Details Page",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("Cart");
              },
              child: Badge(
                label: Text("${AllProductData.dataCart.length}"),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Color(0xffd8f1f8),
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...argu['product_image'].map((e) {
                    return Container(
                      height: 450,
                      width: 450,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(e), fit: BoxFit.fitHeight),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              color: Color(0xffd8f1f8),
              boxShadow: <BoxShadow>[
                BoxShadow(blurRadius: 7, spreadRadius: 1, color: Colors.grey),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${argu['product_name']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "\$${argu['product_price']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                      Text(
                          "------------------------------------------------------------------------------------------"),
                      Text(
                          "------------------------------------------------------------------------------------------"),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${argu['description']}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            AllProductData.dataCart.add(argu);
            AllProductData.convert();
          });
        },
        elevation: 3,
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
