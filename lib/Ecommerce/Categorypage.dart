import 'package:flutter/material.dart';
import 'productdto.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  Map<String, List<Productdto>> categorymap = {};
  List<Productdto> productList = [];
  String? selectedcategory;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    productList = await ProductService().getdata();
    productList.forEach((element) {
      if (element.category != null) {
        if (!categorymap.containsKey(element.category!)) {
          categorymap[element.category!] = [];
        }
        categorymap[element.category]!.add(element);
      }
    });
    if (categorymap.isNotEmpty) {
      selectedcategory = categorymap.keys.first;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: categorymap.length,
                  itemBuilder: (context, index) {
                    String category = categorymap.keys.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedcategory = category;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
                        child: Text(
                          category.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: categorymap[selectedcategory]?.length ?? 0,
                  itemBuilder: (context, index) {
                    Productdto product =
                    categorymap[selectedcategory]![index];
                    return Card(
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: product.image != null
                                ? Image.network(
                              product.image!,
                              fit: BoxFit.contain,
                            )
                                : Placeholder(), // Placeholder for image
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  product.title ?? '',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '\$${product.price.toString()}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  product.description ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
