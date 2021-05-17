import 'package:woodlandHw/models/category.dart';
import 'package:woodlandHw/models/item.dart';
import 'package:woodlandHw/models/promotion.dart';

class Fake {
  static int numberOfItemsInCart = 1;

  static List<Category> categories = [
    Category('assets/icons/chest.svg', 'Living Room'),
    Category('assets/icons/bathtub.svg', 'Bathroom'),
    Category('assets/icons/desk.svg', 'Workspace'),
  ];

  static List<Promotion> promotions = [
    Promotion(
      backgroundImagePath: 'assets/images/splash1.png',
      reverseGradient: false,
      title: 'All Item Furniture\nDiscount Up to',
      subtitle: '50%',
      tag: '30 April 2019',
      imagePath: 'assets/images/furniture/furniture1.png',
    ),
    Promotion(
      backgroundImagePath: 'assets/images/splash2.png',
      reverseGradient: true,
      title: 'Get voucher gift',
      subtitle: '\$50.00',
      caption: '*for new member\'s\nof Furniture Shop',
    )
  ];

  static List<String> trending = [
    'assets/images/furniture/jacalyn-beales-435629-unsplash.png',
    'assets/images/furniture/sven-brandsma-1379481-unsplash.png',
  ];

  static List<String> featured = [
    'assets/images/furniture/pexels-eric-montanah-1350789.jpg',
    'assets/images/furniture/pexels-patryk-kamenczak-775219.jpg',
    'assets/images/furniture/pexels-pixabay-276534.jpg',
    'assets/images/furniture/pexels-steve-johnson-923192.jpg'
  ];

  static List<Item> furniture = [
    Item(
        name: 'Chair Dacey li - Black',
        imagePath: 'assets/images/furniture/items/dacey.png',
        originalPrice: 80,
        rating: 4.5,
        discountPercent: 30,
        description:
            "A contemporary twist on classic mid-century modern design.",
        differentImageUrl: {
          "dacey": ["dacey.png", "CHair 2.png", "dacey.png"],
          "chair3": ["elly.png", "chair3.png", "chair_0_2.png"],
          "chair_2": [
            "CHair 2.png",
            "chair3.png",
            'dacey.png'
            // "chair_2_2.png",
            // "chair_2_3.png",
            // "chair_2_4.png"
          ]
        }),
    Item(
        name: 'Elly Sofa Patchwork',
        imagePath: 'assets/images/furniture/items/elly.png',
        originalPrice: 140,
        rating: 4.4,
        discountPercent: 30,
        description:
            "A contemporary twist on classic mid-century modern design.",
        differentImageUrl: {
          "elly": ["elly.png"],
          "CHair 2": ["CHair 2.png"],
          "chair3": ["chair3.png"]
        }),
    Item(
        name: 'Dobson Table - White',
        imagePath: 'assets/images/furniture/items/table 2.png',
        originalPrice: 160,
        rating: 4.3,
        discountPercent: 25,
        description:
            "A contemporary twist on classic mid-century modern design.",
        differentImageUrl: {
          "table 2": ["table 2.png"],
          "CHair 2": ["CHair 2.png"],
          "chair3": ["chair3.png"]
        }),
    Item(
        name: 'Nagano Table - Brown',
        imagePath: 'assets/images/furniture/items/ezgif.com-crop.png',
        originalPrice: 140,
        rating: 4.3,
        discountPercent: 20,
        description:
            "A contemporary twist on classic mid-century modern design.",
        differentImageUrl: {
          "ezgif.com-crop": ["ezgif.com-crop.png"],
          "CHair 2": ["CHair 2.png"],
          "chair3": ["chair3.png"]
        }),
    Item(
        name: 'Chair Dacey li - White',
        imagePath: 'assets/images/furniture/items/CHair 2.png',
        originalPrice: 80,
        rating: 4.3,
        discountPercent: 20,
        description:
            "A contemporary twist on classic mid-century modern design.",
        differentImageUrl: {
          "elly": ["elly.png"],
          "CHair 2": ["CHair 2.png"],
          "chair3": ["chair3.png"]
        }),
    Item(
        name: 'Chair Dacey li - Feather Grey',
        imagePath: 'assets/images/furniture/items/chair3.png',
        originalPrice: 80,
        rating: 4.0,
        discountPercent: 20,
        description:
            "A contemporary twist on classic mid-century modern design.",
        differentImageUrl: {
          "elly": ["elly.png"],
          "CHair 2": ["CHair 2.png"],
          "chair3": ["chair3.png"]
        }),
  ];
}
