import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ActiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class CustomSliderWidget extends StatefulWidget {
  final List items;
  CustomSliderWidget({this.items});
  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: deprecated_member_use
      overflow: Overflow.visible,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setActiveDot(index);
              },
              enableInfiniteScroll: false,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1.0,
            ),
            items: widget.items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          )),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          left: 20,
          right: 0,
          bottom: 30,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.items.length, (index) {
                return activeIndex == index ? ActiveDot() : InactiveDot();
              })),
        )
      ],
    );
  }
}
