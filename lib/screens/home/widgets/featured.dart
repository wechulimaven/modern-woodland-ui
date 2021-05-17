import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woodlandHw/constants/colors.dart';
import 'package:woodlandHw/data/fake.dart';
import 'package:woodlandHw/screens/category/widgets/furniture_grid_item.dart';
import 'package:woodlandHw/screens/category/widgets/header_sliver.dart';

class FeaturedSection extends StatelessWidget {
  final String title;
  // final List<Widget> children;

  const FeaturedSection(
    this.title,
    // this.children,
    {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
          width: double.infinity,
          // padding: EdgeInsets.symmetric(horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, height: 1),
              ),
              InkWell(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1,
                        color: primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
        Container(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (BuildContext ctxt, int index) {
                  var item = Fake.furniture;
                  Size size = MediaQuery.of(context).size;
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    // color: Colors.blueAccent,
                    height: 160,
                    child: InkWell(
                      // onTap: press,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          // Those are our background
                          Container(
                            height: 136,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color:
                                  index.isEven ? kBlueColor : kSecondaryColor,
                              boxShadow: [kDefaultShadow],
                            ),
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                          // our product image
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Hero(
                              tag: '${item[index].imagePath}',
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                height: 160,
                                // image is square but we add extra 20 + 20 padding thats why width is 200
                                width: 200,
                                child: Image.asset(
                                  item[index].imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Product title and price
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: 136,
                              // our image take 200 width, thats why we set out total width - 200
                              width: size.width - 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      item[index].name,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                  // it use the available space
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          kDefaultPadding * 1.5, // 30 padding
                                      vertical: kDefaultPadding /
                                          4, // 5 top and bottom
                                    ),
                                    decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        topRight: Radius.circular(22),
                                      ),
                                    ),
                                    child: Text(
                                      "KSH ${item[index].price}",
                                      style: Theme.of(context).textTheme.button,
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

                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Container(
                  //     child: new FittedBox(
                  //       child: Material(
                  //           color: Colors.white,
                  //           elevation: 14.0,
                  //           borderRadius: BorderRadius.circular(24.0),
                  //           shadowColor: Color(0x802196F3),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: <Widget>[
                  //               Container(
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.only(left: 16.0),
                  //                   child: Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.spaceEvenly,
                  //                     children: <Widget>[
                  //                       Padding(
                  //                         padding:
                  //                             const EdgeInsets.only(left: 8.0),
                  //                         child: Container(
                  //                             child: Text(
                  //                           item[index].name,
                  //                           style: TextStyle(
                  //                               color: Color(0xffe6020a),
                  //                               fontSize: 24.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         )),
                  //                       ),
                  //                       Padding(
                  //                         padding:
                  //                             const EdgeInsets.only(left: 8.0),
                  //                         child: Container(
                  //                             child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.spaceEvenly,
                  //                           children: <Widget>[
                  //                             Container(
                  //                                 child: Text(
                  //                               "${item[index].rating}",
                  //                               style: TextStyle(
                  //                                 color: Colors.black54,
                  //                                 fontSize: 18.0,
                  //                               ),
                  //                             )),
                  //                             Container(
                  //                               child: Icon(
                  //                                 FontAwesomeIcons.solidStar,
                  //                                 color: Colors.amber,
                  //                                 size: 15.0,
                  //                               ),
                  //                             ),
                  //                             Container(
                  //                               child: Icon(
                  //                                 FontAwesomeIcons.solidStar,
                  //                                 color: Colors.amber,
                  //                                 size: 15.0,
                  //                               ),
                  //                             ),
                  //                             Container(
                  //                               child: Icon(
                  //                                 FontAwesomeIcons.solidStar,
                  //                                 color: Colors.amber,
                  //                                 size: 15.0,
                  //                               ),
                  //                             ),
                  //                             Container(
                  //                               child: Icon(
                  //                                 FontAwesomeIcons.solidStar,
                  //                                 color: Colors.amber,
                  //                                 size: 15.0,
                  //                               ),
                  //                             ),
                  //                             Container(
                  //                               child: Icon(
                  //                                 FontAwesomeIcons
                  //                                     .solidStarHalf,
                  //                                 color: Colors.amber,
                  //                                 size: 15.0,
                  //                               ),
                  //                             ),
                  //                             Container(
                  //                                 child: Text(
                  //                               "(${item[index].rating}) \u00B7 ",
                  //                               style: TextStyle(
                  //                                 color: Colors.black54,
                  //                                 fontSize: 18.0,
                  //                               ),
                  //                             )),
                  //                           ],
                  //                         )),
                  //                       ),
                  //                       Container(
                  //                           child: Text(
                  //                         "'${item[index].price}' \u00B7 KSH",
                  //                         style: TextStyle(
                  //                             color: Colors.black54,
                  //                             fontSize: 18.0,
                  //                             fontWeight: FontWeight.bold),
                  //                       )),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               Container(
                  //                 width: 250,
                  //                 height: 200,
                  //                 child: ClipRRect(
                  //                   borderRadius:
                  //                       new BorderRadius.circular(24.0),
                  //                   child: Image(
                  //                     fit: BoxFit.contain,
                  //                     alignment: Alignment.topRight,
                  //                     image: AssetImage(item[index].imagePath),
                  //                     // NetworkImage(
                  //                     //     "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           )),
                  //     ),
                  //   ),
                  // );
                }))
      ],
    );
  }

  Widget productTile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Candy Bliss",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.3",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                  child: Text(
                "(321) \u00B7 0.9 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
        ),
        Container(
            child: Text(
          "Pastries \u00B7 Phoenix,AZ",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
