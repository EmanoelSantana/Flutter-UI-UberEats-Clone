import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grab_eat_ui/pages/home_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      Center(
        child: Text(
          "Search Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
        ),
      ),
      Center(
        child: Text(
          "Grocery Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
        ),
      ),
      Center(
        child: Text(
          "Orders Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
        ),
      ),
      Center(
        child: Text(
          "Account Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000)),
        ),
      )
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      "assets/images/home_icon.svg",
      "assets/images/search_icon.svg",
      "assets/images/grocery_icon.svg",
      "assets/images/order_icon.svg",
      "assets/images/account_icon.svg"
    ];
    List textItems = ["Home", "Search", "Grocery", "Orders", "Account"];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border(
              top: BorderSide(
                  width: 2, color: Color(0xFF000000).withOpacity(0.06)))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      bottomItems[index],
                      width: 22,
                      color:
                          pageIndex == index ? Color(0xFF000000) : Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 10,
                          color: pageIndex == index
                              ? Color(0xFF000000)
                              : Color(0xFF000000).withOpacity(0.5)),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
