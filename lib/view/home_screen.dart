import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/view/quran/quran_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/items_components.dart';
import '../constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Mubeen',
          style: TextStyle(
            fontSize: w * 0.07,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
          icon: Image.asset(
            'assets/icons/menu.png',
            width: w * 0.09,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ).px8()
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropShadow(
            color: kPrimaryColor,
            child: Image.asset(
              'assets/icons/quran.png',
              width: w * 0.2,
              height: h * 0.1,
            ),
          ),
          DropShadow(
            offset: const Offset(1, 1),
            child: Container(
              width: w,
              height: h * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(45, 179, 174, 1),
                  Color.fromRGBO(126, 198, 148, 1),
                ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Read',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      Text(
                        'Ar-Rahman',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: w * 0.037,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Verse No: 1',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ).p(12),
                  Image.asset(
                    'assets/icons/lantern.png',
                    height: h * 0.12,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  buildHomeItems(
                    w,
                    h,
                    height: 0.22,
                    width: 0.38,
                    color: [
                      const Color.fromRGBO(60, 155, 185, 1),
                      const Color.fromRGBO(115, 189, 195, 1),
                    ],
                    image: 'assets/images/quran.png',
                    title: 'Quran',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QuranScreen();
                      }));
                    },
                  ),
                  buildHomeItems(
                    w,
                    h,
                    height: 0.16,
                    width: 0.36,
                    color: [
                      const Color.fromRGBO(165, 130, 218, 1),
                      const Color.fromRGBO(186, 132, 205, 1),
                    ],
                    image: 'assets/images/reading.png',
                    title: 'Tajwed',
                    onTap: () {},
                  ),
                ],
              ),
              Column(
                children: [
                  buildHomeItems(
                    w,
                    h,
                    height: 0.16,
                    width: 0.36,
                    color: [
                      const Color.fromRGBO(210, 120, 164, 1),
                      const Color.fromRGBO(203, 129, 185, 1),
                    ],
                    image: 'assets/images/moon.png',
                    title: 'Memorize',
                    onTap: () {},
                  ),
                  buildHomeItems(
                    w,
                    h,
                    height: 0.22,
                    width: 0.38,
                    color: [
                      const Color.fromRGBO(125, 166, 232, 1),
                      const Color.fromRGBO(137, 165, 233, 1),
                      Colors.blue
                    ],
                    image: 'assets/images/bookmark.png',
                    title: 'Bookmarks',
                    onTap: () {},
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
