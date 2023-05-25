import 'package:flutter/material.dart';
import 'package:quran_app/view/quran/surah_screen.dart';

import '../../constant/color.dart';
import '../../constant/text.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kScaffoldColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            kAppBarTitle,
            style: TextStyle(
              fontSize: w * 0.07,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: kPrimaryColor,
            ),
          ),
          bottom: TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              indicatorColor: kPrimaryColor,
              labelColor: kPrimaryColor,
              dividerColor: Colors.transparent,
              labelStyle: TextStyle(fontSize: w * 0.045),
              tabs: [
                Tab(
                  text: 'Surah',
                ),
                Tab(
                  text: 'Surah',
                ),
              ]),
        ),
        body: TabBarView(children: [
          SurahScreen(),
          Text('tab2'),
        ]),
      ),
    );
  }
}
