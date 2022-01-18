import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccomerce_app_practice/models/category_model.dart';
import 'package:eccomerce_app_practice/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'product_listening_screen.dart';

class CategoryListeningScreen extends StatelessWidget {
  CategoryServices _categoryServices = CategoryServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories List'),
      ),
      body: Container(
        child: StreamProvider.value(
          value: _categoryServices.streamCategories(),
          initialData: [CategoryModel()],
          builder: (context, child) {
            List<CategoryModel> list = context.watch<List<CategoryModel>>();
            return list[0].categoryId == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : list.isEmpty
                    ? Center(child: Text('No Data'))
                    : ListView.builder(
                        itemCount: list.length,
                        physics: BouncingScrollPhysics(),
                        // reverse: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Get.to(ProductListeningScreen(
                                list[index].categoryId.toString())),
                            child: CategoryItem(
                                imagePath: list[index].categoryImage.toString(),
                                name: list[index].categoryName),
                          );
                        });
          },
        ),
      ),
    );
  }
}

Widget CategoryItem({required String imagePath, name}) {
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
