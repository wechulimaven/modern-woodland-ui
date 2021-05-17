import 'package:flutter/material.dart';
import 'package:woodlandHw/constants/colors.dart';
import 'package:woodlandHw/data/fake.dart';
import 'package:woodlandHw/screens/home/productDetails.dart';
import 'package:woodlandHw/screens/home/product_detail.dart';
import 'package:woodlandHw/widgets/app_bottom_navigation.dart';

import 'widgets/furniture_grid_item.dart';
import 'widgets/header_sliver.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(),
      backgroundColor: colorWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HeaderSliver(
                minExtent: 120,
                maxExtent: 120,
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: Fake.furniture.asMap().entries.map((f) {
                return InkWell(
                  onTap: () {
                    print('CATE TAPPPED');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(product:f.value),
                      ),
                    );
                  },
                  child: FurnitureGridItem(
                      item: f.value,
                      margin: EdgeInsets.only(
                        left: f.key.isEven ? 16 : 0,
                        right: f.key.isOdd ? 16 : 0,
                      )),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
