import 'package:quran_app/helper/api.dart';
import 'package:quran_app/models/surah_model.dart';

main() async {
  var x1 = await GetSurahService().getSurah();
  print(x1);
}

class GetSurahService {
  Future<List<SurahModel>> getSurah() async {
    var data = await ApiHelper().getApi(url: 'http://api.alquran.cloud/v1/quran/quran-uthmani');
    List<SurahModel> surahList = [];

    if (data != null && data['code'] == 200) {
      var surahs = data['data']['surahs'];
      for (var surahData in surahs) {
        surahList.add(SurahModel.fromJson(surahData));
      }
    }

    return surahList;
  }
}
