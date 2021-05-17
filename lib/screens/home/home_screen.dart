import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodlandHw/constants/colors.dart';
import 'package:woodlandHw/data/fake.dart';
import 'package:woodlandHw/screens/category/category_screen.dart';
import 'package:woodlandHw/widgets/app_bottom_navigation.dart';
import 'package:woodlandHw/widgets/cart.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'widgets/category_card.dart';
import 'widgets/drawer.dart';
import 'widgets/featured.dart';
import 'widgets/header.dart';
import 'widgets/image_card.dart';
import 'widgets/promo_card.dart';
import 'widgets/section.dart';
import 'widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onCategorySelected(category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = ClipPath(
      // SizedBox(height: 15.0),
      // Container(
      //   width: double.infinity,
      //   height: 50.0,
      //   margin: EdgeInsets.symmetric(horizontal: 18.0),
      //   padding: EdgeInsets.symmetric(horizontal: 15.0),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(12.0),
      //     color: colorWhite.withOpacity(.9),
      //   ),
      //   child: TextField(
      //     cursorColor: darkYellow,
      //     decoration: InputDecoration(
      //       hintText: "Search Saloon, Spa and Barber",
      //       hintStyle: kHintStyle,
      //       border: InputBorder.none,
      //       icon: Icon(
      //         Icons.search,
      //         color: darkGrey,
      //       ),
      //     ),
      //   ),
      // ),
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: double.infinity,
        height: 150.0,
        padding: EdgeInsets.only(bottom: 40.0),
        // decoration: BoxDecoration(
        //   color: mediumYellow,
        //   // image: DecorationImage(
        //   //   // image: AssetImage("assets/background.jpg"),
        //   //   fit: BoxFit.cover,
        //   // ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.black12.withOpacity(.0),
              elevation: 0,
              // leading: IconButton(

              //   onPressed: () =>Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (_) => SideBar())),
              //   icon:Icon(Icons.menu)),
              actions: [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: () => null,
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (_) => NotificationsPage())),
                    icon: Icon(Icons.notifications)),
                IconButton(
                    onPressed: () => null,
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (_) => SearchPage())),
                    icon: SvgPicture.asset('assets/icons/search_icon.svg'))
              ],
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomNavigation(),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            pinned:true,
            // backgroundColor: Colors.grey[700],
            // Provide a standard title.
            // title: Text('asdas'),
            // pinned: true,
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      'Modern Woodlands',
                      style: TextStyle(fontSize: 24.0, height: 1),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                ],
              ),
              // SizedBox(
              //   width: 5,
              // ),
              // Cart(numberOfItemsInCart: Fake.numberOfItemsInCart),
            ],
            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            // floating: true,
            // Display a placeholder widget to visualize the shrinking size.

            // flexibleSpace: HomeSlider(),

            // Make the initial height of the SliverAppBar larger than normal.
            // expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: CarouselWidget(),
          ),
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header(),
                  Section(
                    'Categories',
                    Fake.categories.map((c) {
                      return CategoryCard(
                        title: c.title,
                        iconPath: c.iconPath,
                        onTap: () {
                          onCategorySelected(c);
                        },
                      );
                    }).toList(),
                  ),
                  // Section(
                  //   'Today\'s Promo',
                  //   Fake.promotions.map((p) {
                  //     return PromoCard(
                  //       title: p.title,
                  //       subtitle: p.subtitle,
                  //       tag: p.tag,
                  //       caption: p.caption,
                  //       imagePath: p.imagePath,
                  //       backgroundImagePath: p.backgroundImagePath,
                  //     );
                  //   }).toList(),
                  // ),
                  Section(
                      'Popular Furniture',
                      Fake.trending
                          .map((imagePath) => ImageCard(imagePath))
                          .toList()),
                  FeaturedSection(
                    'Featured Furniture',
                    // Fake.featured
                    //     .map((imagePath) => ImageCard(imagePath))
                    //     .toList()
                  ),
                ],
              ),
              childCount: 1,
            ),
          )
        ]),
      ),
    );
  }
}
