import 'package:flutter/material.dart';
import 'package:quran_app/constant/color.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/surah_components.dart';
import '../../service/get_surah_service.dart';
import 'ayah_screen.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SearchBar(
            elevation: MaterialStatePropertyAll(0.0),
            hintText: 'Search..',
            hintStyle: MaterialStatePropertyAll(
              TextStyle(color: Colors.grey),
            ),
            trailing: [
              Icon(
                Icons.search_rounded,
                color: Colors.grey,
              )
            ],
          ).p16(),
          SizedBox(
            height: h * 0.69,
            child: FutureBuilder(
                future: GetSurahService().getSurah(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<SurahModel> surahList = snapshot.data!;
                    return ListView.builder(
                        itemCount: surahList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AyahScreen(
                                  surahNumber: index + 1,
                                );
                              }));
                            },
                            child: surahsTitles(w, h, index,
                                    model: surahList[index])
                                .px8(),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
