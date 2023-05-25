class SurahModel {
  final int number;
  final String name;
  final String englishName;
  final String revelationType;
  final List<AyahModel> ayahs;

  SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.revelationType,
    required this.ayahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> ayahsData = jsonData['ayahs'];
    List<AyahModel> ayahsList =
        ayahsData.map((ayahData) => AyahModel.fromJson(ayahData)).toList();

    return SurahModel(
      number: jsonData['number'],
      name: jsonData['name'],
      englishName: jsonData['englishName'],
      revelationType: jsonData['revelationType'],
      ayahs: ayahsList,
    );
  }
}

class AyahModel {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final dynamic sajda;

  AyahModel({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory AyahModel.fromJson(Map<String, dynamic> jsonData) {
    return AyahModel(
      number: jsonData['number'],
      text: jsonData['text'],
      numberInSurah: jsonData['numberInSurah'],
      juz: jsonData['juz'],
      manzil: jsonData['manzil'],
      page: jsonData['page'],
      ruku: jsonData['ruku'],
      hizbQuarter: jsonData['hizbQuarter'],
      sajda: jsonData['sajda'],
    );
  }
}
