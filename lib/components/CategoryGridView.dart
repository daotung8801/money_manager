import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CategoryVWidget.dart';
import 'Category.dart';

class CategoryGridView extends StatelessWidget {
  List<Category> categories;

  CategoryGridView({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 4.0.h,
        mainAxisSpacing: 4.0.w,
        children: List.generate(categories.length,
            (index) => CategoryVWidget(category: categories[index])),
      ),
      // child: FutureBuilder<List<Category>>(
      //   future: categories,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData){
      //       return GridView.count(crossAxisCount: crossAxisCount)
      //       return GridView.builder(
      //           itemCount: snapshot.data?.length,
      //           scrollDirection: Axis.vertical,
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 4, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      //           itemBuilder: (context, index) {
      //             return GestureDetector(
      //               child: CategoryVWidget(category: snapshot.data![index],),
      //               onTap: () {
      //
      //               },
      //             );
      //           });
      //     } else if (snapshot.hasError){
      //       return Text("Error");
      //     } else {
      //       return CircularProgressIndicator();;
      //     }
      //
      //   },
      // )
    );
  }
}
