import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final VoidCallback onTap;
  final String titleButton;
  final Color color;
 final List<Color> allColors = [
    Color(0xff92cc72),
    Color(0xff9DcD65),
    Color(0xffAcD053),
    Color(0xffBBD242),
  ];

  StaggerAnimation({
    Key key,
    this.buttonController,
    this.onTap,
    this.color,
    this.titleButton = "Sign In",
  })  : buttonSqueezeanimation = Tween(
          begin: 320.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.0,
              0.150,
            ),
          ),
        ),
        containerCircleAnimation = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 30.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonSqueezeanimation.value,
        height: 50,
        alignment: FractionalOffset.center,
        decoration: color == null
            ? BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.2,
                      0.5,
                      0.7,
                      0.9
                    ],
                    colors: [
                      allColors[0],
                      allColors[1],
                      allColors[2],
                      allColors[3]
                    ]),
                borderRadius: BorderRadius.all(const Radius.circular(25.0)),
              )
            : BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(const Radius.circular(25.0)),
              ),
        child: buttonSqueezeanimation.value > 75.0
            ? Text(
                titleButton,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.3,
                ),
              )
            : CircularProgressIndicator(
                value: null,
                strokeWidth: 1.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}
