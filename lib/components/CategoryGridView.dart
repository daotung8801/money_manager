import 'package:flutter/material.dart';
import 'CategoryVWidget.dart';
import 'Category.dart';

class CategoryGridView extends StatelessWidget {
  Future<List<Category>> categories;

  CategoryGridView({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: FutureBuilder<List<Category>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return GridView.builder(
                itemCount: snapshot.data?.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: CategoryVWidget(category: snapshot.data![index],),
                    onTap: () {

                    },
                  );
                });
          } else if (snapshot.hasError){
            return Text("Error");
          } else {
            return CircularProgressIndicator();;
          }

        },
      )
    );
  }
}
