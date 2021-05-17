import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard(
    this.imagePath, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget overLay = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: -0.5,
      child: InkWell(
        onTap: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 100,
          child: Center(
              child: new Text("Register",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.8),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );
    return Container(
      width: 270,
      height: 180,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(7.0),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(0.05),
      //         offset: Offset.zero,
      //         blurRadius: 15.0,
      //       )
      //     ],
      //     image: DecorationImage(
      //         image: AssetImage(this.imagePath), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Container(
            // width: 270,
            // height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset.zero,
                  blurRadius: 15.0,
                )
              ],
              image: DecorationImage(
                  image: AssetImage(this.imagePath), fit: BoxFit.cover),
            ),
          ),
          // overLay
        ],
      ),
    );
  }
}
