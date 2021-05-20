import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodlandHw/constants/colors.dart';
import 'package:woodlandHw/models/item.dart';
import 'package:woodlandHw/screens/cartScreen/cartScreen.dart';
import 'package:woodlandHw/widgets/product_image.dart';

class DetailsScreen extends StatefulWidget {
  final Item product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List images = List<String>(), similarImages = List<String>();
  List<int> colorList = [0xFF304B82, 0xFFBB4747, 0xFFF8C187, 0xFF5ABE65];
  int selectedColorIndex = 0,
      scrolledImageIndex = 0,
      selectedSimilarColorIndex = 0;
  int purchaseCount = 1;

  Widget getColors(int index) {
    return GestureDetector(
      onTap: () {
        selectedColorIndex = index;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: 31,
        height: 31,
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedColorIndex == index
                  ? Color(colorList[index])
                  : Colors.white,
              width: 1),
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(31),
          ),
        ),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: Color(colorList[index]),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSimilarColorImage(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSimilarColorIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.only(top: 2, bottom: 2, right: 20),
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
              color: selectedSimilarColorIndex == index
                  ? Color(0xFFC2D8FD)
                  : Colors.transparent,
              width: 2),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xFFE7EEF8),
                blurRadius: 1,
                offset: Offset(2.6, 2.6))
          ],
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(
                  "assets/images/furniture/items/${similarImages[index]}"),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroudColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(
          left: kDefaultPadding,
        ),
        icon: SvgPicture.asset('assets/icons/back.svg'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    images = widget.product.differentImageUrl.keys.toList();
    similarImages = widget.product.differentImageUrl[images[scrolledImageIndex]];

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Expanded(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  color: kBackgroudColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Expanded(
                                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Hero(
                          tag: '${widget.product.imagePath}',
                          child: ProductPoster(
                            size: size,
                            image: widget.product.imagePath,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:10
                      ),
                      // Expanded(child: SizedBox()),
                              Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Color(0xFFE7EEF8),
                                          blurRadius: 1,
                                          offset: Offset(2.6, 2.6))
                                    ],
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 25.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: colorList
                                          .asMap()
                                          .entries
                                          .map((MapEntry map) =>
                                              getColors(map.key))
                                          .toList(),
                                    ),
                                  )),
                      // ListOfColors(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: Text(
                          widget.product.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Text(
                        'KSH ${widget.product.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                          widget.product.description,
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding)
                    ],
                  ),
                ),
              ),
              cartBtn(context, widget.product),
            ],
          ),
        ),
      ),
    )
    );
  }

  Widget cartBtn (context, Item item){return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 3,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          children: <Widget>[
            // SvgPicture.asset(
            //   'assets/icons/profile.svg',
            //   height: 18,
            // ),
            // SizedBox(
            //   width: kDefaultPadding / 2,
            // ),
            // Text(
            //   "Chat",
            //   style: TextStyle(color: Colors.white),
            // ),
            // It will cover all available space
            Spacer(),
            FlatButton.icon(
              onPressed: () {
                Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => cart(products:item),
        ),
    );
              },
              icon: SvgPicture.asset(
                'assets/icons/wallet.svg',
                height: 18,
              ),
              label: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );}

  
}
