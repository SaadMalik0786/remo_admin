import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '/utils/constants.dart';

class MainCarousel extends StatelessWidget {
  const MainCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            height: 200,
            width: MediaQuery.of(context).size.width,
            Const.mainCarousalBackground,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          const Center(
            child: Text(
              "Check out our new selection of professional power tools",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: DotsIndicator(
                dotsCount: 3,
                position: 0,
                decorator: const DotsDecorator(
                  color: Colors.white, // Inactive color
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
