import 'package:flutter/material.dart';
import 'Utility.dart';

class ProductDescWidget extends StatefulWidget {
  const ProductDescWidget({Key? key}) : super(key: key);

  @override
  State<ProductDescWidget> createState() => _ProductDescWidgetState();
}

class _ProductDescWidgetState extends State<ProductDescWidget> {
  utility util = utility();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://backend.orbitvu.com/sites/default/files/2022-11/Good-example-product-photography-shoes-perfect-angle.jpg"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 25,
                                color: Colors.yellow,
                              ),
                              Text(
                                " 4.2 (34 Reviews)",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Product Title",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              Text("122",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Description Product",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem najdfh idhH sffbdb awrgarg sgrgsrg  3ufhw3ug w fgwfwigfiwugf uwifiw fwhrfiurg fwruifhwru hrg",
                            style: TextStyle(color: Colors.black54),
                            softWrap: true,
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Variants",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      util.variantContainer(),
                                      util.variantContainer(),
                                      util.variantContainer(),
                                      util.variantContainer(),
                                      util.variantContainer(),
                                      util.variantContainer(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Time",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 20, 10, 0),
                                    child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                              "https://static.vecteezy.com/system/resources/previews/006/184/883/non_2x/box-delivery-icon-for-website-symbol-presentation-free-vector.jpg",
                                            ),
                                          ),
                                          Text(
                                            "Standard Delivery",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "10 Aug - 12 Aug",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      color: Colors.grey.shade200,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // final cartdetails = cartModal(img: )
                          },
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(500, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Color(0xFFffe174),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
