import 'package:flutter/material.dart';
class Design extends StatelessWidget {
  Design({
    super.key,
    required this.image,
    required this.circleContainer,
    required this.boxDecorationContainer,
    required this.borderContainer,
    required this.text,
    this.colorImage,
    required this.padding,
    required this.onTap,
  });

  String image;
  Color circleContainer;
  Color boxDecorationContainer;
  Color borderContainer;
  String text;
  double padding;
  Color? colorImage;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Robot Icon in a circle
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: circleContainer, // Circle background color
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Image.asset(
                color: colorImage,
                image, // Placeholder image
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Space between the circle and button text
          SizedBox(width: 20), // Optional spacing
          // Button for Single Player
          InkWell(
            onTap: onTap,
            child: Container(
              width: mediaQuery.width * 0.6,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: boxDecorationContainer, // Button background color
                borderRadius: BorderRadius.circular(30), // Rounded edges
                border: Border.all(color: borderContainer, width: 3), // Border color
              ),
              child: Text(
                text,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      );
  }
}


