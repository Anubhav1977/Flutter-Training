import 'package:flutter/material.dart';
import 'Utility.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String? txt;
  String? url;
  utility util = utility();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerboxisSelected) => [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://img.freepik.com/free-vector/black-friday-sale-red-comic-style-background_1055-9002.jpg",
                fit: BoxFit.fill,
              ),
            ),
            forceElevated: innerboxisSelected,
            backgroundColor: Color(0xFF4e7861),
            expandedHeight: 250,
            title: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_outlined, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: Icon(Icons.local_grocery_store_outlined,
                      color: Colors.white),
                ),
              ],
            ),
            pinned: true,
          ),
        ],
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  items: [
                    util.sliderUtil(
                        "Buy Now",
                        "https://graphicsfamily.com/wp-content/uploads/edd/2022/12/E-commerce-Product-Banner-Design-Download-scaled.jpg",
                        context),
                    util.sliderUtil(
                        "Check Out",
                        "https://t4.ftcdn.net/jpg/03/83/21/85/360_F_383218557_t5fC98hOdrg0hr4BsulCZ9mPX9a4uube.jpg",
                        context),
                    util.sliderUtil(
                        "Know More",
                        "https://static.vecteezy.com/system/resources/thumbnails/002/006/774/small/paper-art-shopping-online-on-smartphone-and-new-buy-sale-promotion-backgroud-for-banner-market-ecommerce-free-vector.jpg",
                        context),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Category",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Show More",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                              util.categoryCicles(
                                  "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-madebymath-90946.jpg&fm=jpg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Flash Sale",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Closing in : ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              util.flashSaleContainer(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGnJfkHiqbXMcHzYroPpFv1ZRqk387Dq6jFg&s",
                                  "Clothing",
                                  "Upto 20% Off",
                                  context),
                              util.flashSaleContainer(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGnJfkHiqbXMcHzYroPpFv1ZRqk387Dq6jFg&s",
                                  "Clothing",
                                  "Upto 20% Off",
                                  context),
                              util.flashSaleContainer(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGnJfkHiqbXMcHzYroPpFv1ZRqk387Dq6jFg&s",
                                  "Clothing",
                                  "Upto 20% Off",
                                  context),
                              util.flashSaleContainer(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGnJfkHiqbXMcHzYroPpFv1ZRqk387Dq6jFg&s",
                                  "Clothing",
                                  "Upto 20% Off",
                                  context),
                              util.flashSaleContainer(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGnJfkHiqbXMcHzYroPpFv1ZRqk387Dq6jFg&s",
                                  "Clothing",
                                  "Upto 20% Off",
                                  context),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 560,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xb161c6b9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You might like",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xff0a16ea),
                              radius: 11,
                              child: Center(
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    iconSize: 15,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 560,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xb161c6b9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You might like",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xff0a16ea),
                              radius: 11,
                              child: Center(
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    iconSize: 15,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 560,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xb161c6b9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "You might like",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xff0a16ea),
                              radius: 11,
                              child: Center(
                                child: IconButton(
                                    padding: EdgeInsets.zero,
                                    iconSize: 15,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "T-Shirts",
                              "＄122.00",
                              "product",
                              false,
                              context),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "True Wireless",
                              "122.00",
                              "product",
                              false,
                              context),
                          util.productContainer(
                              "https://chriscross.in/cdn/shop/files/ChrisCrossPhotographer_sBlackmelangecottonT-Shirt_800x.jpg?v=1695630855",
                              "True Wireless",
                              "122.00",
                              "product",
                              false,
                              context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
