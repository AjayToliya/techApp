import 'package:flutter/material.dart';

import '../utils/product.dart';

class cartpage extends StatefulWidget {
  const cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffd8f1f8),
        title: Text(
          "Cart Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: (AllProductData.dataCart.length == 0)
          ? Container(
              alignment: Alignment.center,
              child: Text(
                "No Data Found",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: AllProductData.cartProductData
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 350,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color(0xffd8f1f8),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      color: Colors.grey,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "${e['product_image']}"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${e['product_name']}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "\$${e['product_price']}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                AllProductData.cartProductData
                                                    .remove(e);
                                                AllProductData.dataCart
                                                    .remove(e);
                                              });
                                            },
                                            child: const Text(
                                              "DELETE",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xffd8f1f8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price:",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$ ${AllProductData.totalPrice()}",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
