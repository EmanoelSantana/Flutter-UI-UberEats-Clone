// ignore_for_file: unused_local_variable, prefer_const_constructors, use_key_in_widget_constructors
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grab_eat_ui/pages/custom_slider.dart';
import 'package:grab_eat_ui/pages/store_detail_page.dart';

import 'home_page_json.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    const List menu = ["Delivery", "Pickup", "Dine-In"];
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                menu.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeMenu = index;
                        });
                      },
                      child: activeMenu == index
                          ? ElasticIn(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 8, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        menu[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 8, top: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      menu[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 45,
                  width: size.width - 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/pin_icon.svg",
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "New York",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/images/time_icon.svg",
                                    width: 20),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Now",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SvgPicture.asset("assets/images/filter_icon.svg"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            CustomSliderWidget(
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                "assets/images/slide_1.jpg",
                "assets/images/slide_2.jpg",
                "assets/images/slide_3.jpg"
              ],
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Row(
                          children: List.generate(
                            categories.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      categories[index]['img'],
                                      width: 40,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      categories[index]['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: size.width,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoreDetailPage(
                              img: firstMenu[0]['img'],
                            )),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: size.width,
                            height: 160,
                            child: Image(
                              image: NetworkImage(firstMenu[0]['img']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: SvgPicture.asset(
                              firstMenu[0]['is_liked']
                                  ? 'assets/images/loved_icon.svg'
                                  : 'assets/images/love_icon.svg',
                              width: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        firstMenu[0]['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Sponsored",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.info,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        firstMenu[0]['description'],
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(
                                Icons.hourglass_bottom,
                                color: Color(0xFF00954d),
                                size: 16,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                firstMenu[0]['time'],
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                firstMenu[0]['delivery_fee'],
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: size.width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "More to explore",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        exploreMenu.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoreDetailPage(
                                          img: exploreMenu[index]['img'],
                                        )),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: size.width,
                                        height: 160,
                                        child: Image(
                                          image: NetworkImage(
                                              exploreMenu[index]['img']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        right: 15,
                                        child: SvgPicture.asset(
                                          exploreMenu[index]['is_liked']
                                              ? 'assets/images/loved_icon.svg'
                                              : 'assets/images/love_icon.svg',
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    exploreMenu[index]['name'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "Sponsored",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.info,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    exploreMenu[index]['description'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Icon(
                                            Icons.hourglass_bottom,
                                            color: Color(0xFF00954d),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            exploreMenu[index]['time'],
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              Text(
                                                exploreMenu[index]['rate'],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              SizedBox(width: 3),
                                              Icon(
                                                Icons.star,
                                                color: Color(0xFFfacb00),
                                                size: 17,
                                              ),
                                              SizedBox(width: 3),
                                              Text(
                                                exploreMenu[index]
                                                    ['rate_number'],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Near You",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        populaNearYou.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StoreDetailPage(
                                    img: populaNearYou[index]['img'],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: size.width,
                                        height: 160,
                                        child: Image(
                                          image: NetworkImage(
                                              populaNearYou[index]['img']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        right: 15,
                                        child: SvgPicture.asset(
                                          exploreMenu[index]['is_liked']
                                              ? 'assets/images/loved_icon.svg'
                                              : 'assets/images/love_icon.svg',
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    exploreMenu[index]['name'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "Sponsored",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.info,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    exploreMenu[index]['description'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Icon(
                                            Icons.hourglass_bottom,
                                            color: Color(0xFF00954d),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            exploreMenu[index]['time'],
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              Text(
                                                exploreMenu[index]['rate'],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              SizedBox(width: 3),
                                              Icon(
                                                Icons.star,
                                                color: Color(0xFFfacb00),
                                                size: 17,
                                              ),
                                              SizedBox(width: 3),
                                              Text(
                                                exploreMenu[index]
                                                    ['rate_number'],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
