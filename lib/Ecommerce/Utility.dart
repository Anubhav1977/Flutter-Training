import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cartModal {
  String? img;
  String? price;
  String? title;

  cartModal({this.img, this.price, this.title});
}

class cartService {
  Future getData() async {
    String response =
        await rootBundle.loadString('assets/mockjson/Productjson.json');
    print(response);
  }
}

class utility {
  sliderUtil(String txt, String url, BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(url),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(bottom: 15),
          ),
        ),
        Positioned(
          bottom: 1,
          left: 80,
          right: 80,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              txt,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFffe174),
            ),
          ),
        ),
      ],
    );
  }

  categoryCicles(String imgurl) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 0, 0),
      child: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(imgurl),
        backgroundColor: Colors.white, //Color(0x46863e8f),
      ),

      // Text("txt1",
      //     style: TextStyle(
      //         fontSize: 10, fontWeight: FontWeight.w600)),
      // Text("txt2",
      //     style: TextStyle(
      //         fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }

  flashSaleContainer(
      String img, String txt, String offer, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/productdesc');
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(8, 12, 0, 0),
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(200),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                      topRight: Radius.circular(200),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(img), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 15,
                    child: IconButton(
                        iconSize: 18,
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          final cartDetails =
                              cartModal(img: img, title: txt, price: offer);
                          Navigator.pushNamed(context, "/cart",
                              arguments: cartDetails);
                        },
                        icon: Icon(Icons.add)),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink.shade100,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                spreadRadius: 0,
                                blurRadius: 15)
                          ]),
                      child: Text(
                        "10% Off",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    )),
              ],
            ),
            Container(
                child: Column(
              children: [
                Text(
                  txt,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  offer,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  productContainer(
    String img,
    String title,
    String price,
    String category,
    bool isSelected,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/productdesc');
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
        padding: EdgeInsets.all(0),
        height: 230,
        width: 165,
        decoration: BoxDecoration(
          color: Color(0xFF4e7861),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Column(
          children: [
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover),
              ),
              child: Stack(children: [
                Positioned(
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: isSelected
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline_outlined,
                            color: Colors.black,
                          ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 15,
                    child: IconButton(
                        iconSize: 18,
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          final cartDetails =
                              cartModal(img: img, title: title, price: price);
                          Navigator.pushNamed(context, "/cart",
                              arguments: cartDetails);
                        },
                        icon: Icon(Icons.add)),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      category,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  variantContainer() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Color(0xFF4e7861),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "V",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
