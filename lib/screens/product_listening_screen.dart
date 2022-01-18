import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccomerce_app_practice/models/product_model.dart';
import 'package:eccomerce_app_practice/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductListeningScreen extends StatelessWidget {
  ProductListeningScreen(this.categoryID);

  String categoryID;

  ProductServices _productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: StreamProvider.value(
        value: _productServices.streamProduct(categoryID),
        initialData: [ProductModel()],
        builder: (context, child) {
          List<ProductModel> list = context.watch<List<ProductModel>>();
          return list[0].categoryId == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : list.isEmpty
                  ? Center(child: Text('No Data'))
                  : ListView.builder(
                      itemCount: list.length,
                      physics: BouncingScrollPhysics(),
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => print(categoryID),
                          child: ProductItem(
                              name: list[index].productName.toString(),
                              imagePath: list[index].productImage.toString(),
                              price: list[index].productPrice.toString()),
                        );
                      });
        },
      ),
    );
  }
}

Widget ProductItem({required String name, imagePath, price}) {
  // return Container(
  //   child: Column(
  //     children: [
  //       Text(
  //         name,
  //         style: TextStyle(fontSize: 23),
  //       ),
  //       Image.network(imagePath),
  //       Text("RS: $price"),
  //       RatingBarIndicator(
  //         rating: 3.0,
  //         itemBuilder: (context, index) => Icon(
  //           Icons.star,
  //           color: Colors.amber,
  //         ),
  //         itemCount: 5,
  //         itemSize: 30.0,
  //         direction: Axis.horizontal,
  //       ),
  //     ],
  //   ),
  // );
  return Card(
    margin: EdgeInsets.all(8),
    elevation: 1,
    color: Colors.red.shade100,
    shape: Border.all(color: Colors.red.shade100, width: 2),
    child: Column(
      children: [
        // Image.network(imagePath),
        CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            name!,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
