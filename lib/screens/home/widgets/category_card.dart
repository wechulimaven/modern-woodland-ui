import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:woodlandHw/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function() onTap;

  const CategoryCard({
    Key key,
    @required this.title,
    @required this.iconPath,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: colorWhite,
              child: Center(
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      child: SvgPicture.asset(
                        iconPath,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget main() => Container(
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorWhite,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset.zero,
                blurRadius: 15.0,
                spreadRadius: 3)
          ],
        ),
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                height: 42,
                width: 42,
                child: SvgPicture.asset(
                  iconPath,
                  color: primaryColor,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      );
}
