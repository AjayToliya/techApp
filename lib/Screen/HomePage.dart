import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_app/utils/product.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String? dropDrown;
  double fromval = 0;
  double toval = 2000;
  RangeValues values = RangeValues(0, 2000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd8f1f8),
        leading: Icon(
          Icons.menu,
          color: Color(0xff444d72),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: Color(0xff444d72),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xffd8f1f8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.search_rounded,
                                  size: 35,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Search your favourit food",
                                    style: TextStyle(
                                      fontSize: 16.5,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.compare_arrows_rounded,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xffd8f1f8),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  width: 290,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        DropdownButton(
                          hint: const Text(
                            "Select category...",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          value: dropDrown,
                          onChanged: (val) {
                            setState(() {
                              dropDrown = val as String;
                            });
                          },
                          items: AllProductData.data
                              .map(
                                (val) => DropdownMenuItem(
                                  value: val['product_category'],
                                  child: Text(
                                    val['product_category'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        (dropDrown != null)
                            ? ActionChip(
                                onPressed: () {
                                  setState(() {
                                    dropDrown = null;
                                    values = RangeValues(fromval, toval);
                                  });
                                },
                                avatar: Icon(Icons.close),
                                label: Text(
                                  "Close",
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...AllProductData.data.map(
                    (val) => Padding(
                      padding: EdgeInsets.only(left: 4, right: 4),
                      child: Container(
                        color: Color(0xffd8f1f8),
                        height: 320,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...val['categoryProducts']
                                  .map(
                                    (Map<String, dynamic> e) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6,
                                          top: 8,
                                          right: 18,
                                          bottom: 8),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              'Details',
                                              arguments: e);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 250,
                                            height: 290,
                                            // margin: EdgeInsets.only(right: 13),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              topRight: Radius
                                                                  .circular(
                                                                      25)),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Text(
                                                                      "\$ ${e['product_price']}",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: CircleAvatar(
                                                            radius: 85,
                                                            foregroundImage:
                                                                NetworkImage(
                                                                    "${e['thumbnail']}"),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(20),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Text(
                                                                    "${e['product_name']}",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffdcf1f9),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(500)),
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).pushNamed('Cart');
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(500)),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(500)),
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
