import 'package:flutter/material.dart';
import 'package:quran_app/constant/color.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/service/get_surah_service.dart';

class AyahScreen extends StatelessWidget {
  final int surahNumber;

  const AyahScreen({Key? key, required this.surahNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.7),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: GetSurahService().getSurah(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SurahModel> surahList = snapshot.data as List<SurahModel>;
            return ListView.builder(
                itemCount: surahList[surahNumber].number,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  SurahModel surah = surahList[index];
                  return surah.number == surahNumber
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: w,
                              height: h * 0.15,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.7),
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(60))),
                              child: Text(
                                '${surah.name}',
                                style: TextStyle(
                                    fontSize: w * 0.15, color: kTextColor),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.6,
                              child: ListView.builder(
                                  itemCount: surah.ayahs.length,
                                  itemBuilder: (context, ayahIndex) {
                                    AyahModel ayah = surah.ayahs[ayahIndex];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          ayah.text,
                                          style: TextStyle(fontSize: w * 0.07),
                                          textWidthBasis:
                                              TextWidthBasis.longestLine,
                                        ),
                                      ],
                                    );
                                  }),
                            )
                          ],
                        )
                      : null;
                });
            // return ListView.builder(
            //   itemCount: surahList.length,
            //   itemBuilder: (context, index) {
            //     SurahModel surah = surahList[index];
            //     return Column(
            //       children: [
            //         Text(
            //           surah.name,
            //           style: const TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 16,
            //           ),
            //         ),
            //         ListView.builder(
            //           itemCount: surah.ayahs.length,
            //           shrinkWrap: true,
            //           physics: const NeverScrollableScrollPhysics(),
            //           itemBuilder: (context, ayahIndex) {
            //             AyahModel ayah = surah.ayahs[ayahIndex];
            //             return Text(
            //                     ayah.text,
            //                     textAlign: TextAlign.center,
            //                   );
            //           },
            //         ),
            //         const Divider(),
            //       ],
            //     );
            //   },
            // );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
