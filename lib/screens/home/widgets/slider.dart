import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:woodlandHw/constants/colors.dart';
import 'package:woodlandHw/models/carosole.dart';

class CarouselWidget extends StatelessWidget {
  List<Carousel> carouselList = [
    Carousel(image: "assets/images/grand-opening.jpg"),
    Carousel(image: "assets/images/sale-banner-template-design_74379-121.jpg"),
    Carousel(image: "assets/images/online-shopping-banner_82574-3393.jpg"),
    Carousel(
        image:
            "assets/images/50304057-colourful-shopping-vector-flat-banner-for-your-business-web-sites-etc-quality-design-illustrations-e.jpg"),
    Carousel(
        image:
            "assets/images/82024571-online-shop-banner-design-for-promotion-with-shop-front-and-shopping-icons-flat-design-vector-illust.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180.0,
      color: Colors.white,
      child: Swiper(
        itemCount: carouselList.length,
        autoplay: true,
        pagination: SwiperPagination(),
        itemBuilder: (context, index) {
          var carousel = carouselList[index];
          return Container(
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // color: Colors.amberAccent,
              image: DecorationImage(
                image: AssetImage(carousel.image),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 30.0,
                    color: kBlackAccent.withOpacity(.5),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
