import 'package:erasmus_connect/screens/homepage/bottom_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SchoolsPage extends StatefulWidget {
  @override
  _SchoolsPageState createState() => _SchoolsPageState();
}

class _SchoolsPageState extends State<SchoolsPage> {
  List<bool> dropdownOpenState = [false, false, false, false, false];

  final List<String> images = [];

  final List<String> countryNames = [
    'Türkiye',
    'İsveç',
    'İtalya',
    'Almanya',
    'İngiltere'
  ];

  List<List<List<String>>> universityContent = [
    [
      [
        "İstanbul Teknik Üniversitesi (İTÜ) Erasmus Programı, öğrencilere uluslararası öğrenci değişimi fırsatı sunar. İTÜ'nün resmi Erasmus web sayfası üzerinden başvuru süreci, destek ve danışmanlık, Erasmus hibe ve bursları ile Erasmus ortak üniversiteleri hakkında ayrıntılı bilgilere ulaşabilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "erasmus.itu.edu.tr",
        "",
        "",
      ],
      [
        "Orta Doğu Teknik Üniversitesi (ODTÜ), öğrencilere Erasmus Programı aracılığıyla uluslararası öğrenci değişimi fırsatı sunmaktadır. ODTÜ'nün resmi Erasmus web sayfası üzerinden başvuru süreci, destek ve danışmanlık, Erasmus hibe ve bursları ile ODTÜ'nün Erasmus anlaşması olan üniversiteler hakkında detaylı bilgilere ulaşabilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "ico.metu.edu.tr",
        "",
        "",
      ],
      [
        "Boğaziçi Üniversitesi, öğrencilere Erasmus Programı ile uluslararası öğrenci değişimi imkanı sunmaktadır. Boğaziçi Üniversitesi'nin resmi ",
        "Erasmus web sayfası",
        "intl.boun.edu.tr",
        " üzerinden başvuru süreci, destek ve danışmanlık, Erasmus hibe ve bursları ile Boğaziçi Üniversitesi'nin Erasmus anlaşması bulunan üniversiteler hakkında ayrıntılı bilgilere ulaşabilirsiniz.",
        "/",
      ],
    ],
    [
      [
        "Boras Üniversitesi, öğrencilere Erasmus Programı ile uluslararası öğrenci değişimi fırsatı sunmaktadır. Boras Üniversitesi'nin resmi Erasmus web sayfası üzerinden başvuru süreci, destek ve danışmanlık, Erasmus hibe ve bursları ile Boras Üniversitesi'nin Erasmus anlaşması bulunan üniversiteler hakkında ayrıntılı bilgilere ulaşabilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.hb.se",
        "",
        "/en/international-student",
      ],
      [
        "Uppsala Üniversitesi, öğrencilere Erasmus Programı ile uluslararası öğrenci değişimi fırsatı sunmaktadır. Uppsala Üniversitesi'nin resmi Erasmus web sayfası üzerinden başvuru süreci, destek ve danışmanlık, Erasmus hibe ve bursları ile Uppsala Üniversitesi'nin Erasmus anlaşması bulunan üniversiteler hakkında ayrıntılı bilgilere ulaşabilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.uu.se",
        "",
        "/en/study/exchange-studies",
      ],
      [
        "Stockholm Üniversitesi, Erasmus Programı aracılığıyla uluslararası öğrencilere değişim fırsatı sunmaktadır. Stockholm Üniversitesi'nin resmi Erasmus web sayfası üzerinden başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve burs olanakları ile Stockholm Üniversitesi'nin Erasmus anlaşması bulunan diğer üniversiteler hakkında ayrıntılı bilgilere erişebilirsiniz. İlgili linke ",
        "buradan ulaşabilirsiniz",
        "www.su.se",
        "",
        "/english/education/exchange-students",
      ],
    ],
    [
      [
        "Bologna Üniversitesi, uluslararası öğrencilere Erasmus Programı ile değişim imkanı sunmaktadır. Bologna Üniversitesi'nin resmi Erasmus web sayfası üzerinden başvuru süreci, danışmanlık ve destek hizmetleri, Erasmus hibe ve bursları ile Bologna Üniversitesi'nin Erasmus anlaşması bulunan üniversiteler hakkında detaylı bilgilere ulaşabilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.unibo.it",
        "",
        "/en/international",
      ],
      [
        "Milano Üniversitesi, uluslararası öğrencilere Erasmus Programı aracılığıyla değişim fırsatı sunmaktadır. Milano Üniversitesi'nin resmi Erasmus web sayfası üzerinden başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve bursları ile Milano Üniversitesi'nin Erasmus anlaşması bulunan üniversiteler hakkında ayrıntılı bilgilere erişebilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.unimi.it",
        "",
        "/en/international",
      ],
      [
        "Roma La Sapienza Üniversitesi, Erasmus Programı kapsamında uluslararası öğrencilere değişim imkanı sunmaktadır. Roma La Sapienza Üniversitesi'nin resmi Erasmus web sayfası üzerinden başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve bursları ile Roma La Sapienza Üniversitesi'nin Erasmus anlaşması bulunan üniversiteler hakkında detaylı bilgilere ulaşabilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.uniroma1.it",
        "",
        "/en/pagina/erasmus-programme",
      ],
    ],
    [
      [
        "Münih Teknik Üniversitesi (Technical University of Munich), mükemmeliyetçilik ve yenilikçilik anlayışıyla öne çıkan, dünya çapında saygın bir üniversitedir. Erasmus Programı ile Münih Teknik Üniversitesi'nin sunduğu eğitim imkanlarından yararlanabilirsiniz. Münih Teknik Üniversitesi'nin resmi ",
        "Erasmus web sayfası",
        "www.mgt.tum.de",
        " üzerinden başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve burs olanakları hakkında ayrıntılı bilgilere ulaşabilirsiniz. Üniversitenin farklı bölümleri, programları ve araştırma imkanları hakkında daha fazla bilgi edinebilirsiniz.",
        "/programs/international-exchange-programs/incoming-exchange-students",
      ],
      [
        "Berlin Teknik Üniversitesi'nin resmi ",
        "Erasmus web sayfası",
        "www.tu.berlin",
        " üzerinden başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve burs olanakları hakkında ayrıntılı bilgilere ulaşabilirsiniz. Üniversitenin farklı fakülteleri, programları ve araştırma projeleri hakkında daha fazla bilgi edinebilirsiniz. Erasmus öğrencileri, Berlin Teknik Üniversitesi'nin dinamik ve çeşitli akademik ortamında eğitim alabilir, uluslararası öğrenci topluluğuyla etkileşimde bulunabilirler. Berlin şehri ise sanat, kültür ve tarih açısından zengin bir merkez olup öğrencilere eşsiz bir deneyim sunmaktadır.",
        "/en/international/students-1/international-students/exchange-studies-at-tu-berlin",
      ],
      [
        "Stuttgart Üniversitesi'nin resmi ",
        "Erasmus web sayfası",
        "www.student.uni-stuttgart.de",
        " üzerinden başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve burs olanakları hakkında ayrıntılı bilgilere ulaşabilirsiniz. Üniversitenin çeşitli fakülteleri, programları ve araştırma projeleri hakkında daha fazla bilgi edinebilirsiniz. Stuttgart Üniversitesi'nde geçireceğiniz Erasmus dönemi, akademik gelişiminizin yanı sıra farklı kültürleri tanıma ve yeni deneyimler kazanma fırsatı sunacaktır.",
        "/en/study-abroad/exchange",
      ],
    ],
    [
      [
        "Oxford Üniversitesi Erasmus Programı Oxford Üniversitesi, uluslararası öğrencilere yüksek kalitede eğitim imkanı sunan ve dünyaca ünlü bir üniversitedir. Erasmus Programı aracılığıyla Oxford Üniversitesi'nde eğitim alma fırsatı elde edebilirsiniz. Oxford Üniversitesi'nin resmi Erasmus web sayfası, başvuru süreci, danışmanlık hizmetleri, Erasmus hibe ve bursları hakkında ayrıntılı bilgileri içermektedir. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.ox.ac.uk",
        "",
        "/admissions/undergraduate/applying-to-oxford/for-international-students",
      ],
      [
        "Cambridge Üniversitesi, dünya genelinde prestijli bir üniversite olarak tanınır ve uluslararası öğrencilere eşsiz bir eğitim deneyimi sunar. Erasmus Programı sayesinde Cambridge Üniversitesi'nde öğrenim görebilirsiniz. Cambridge Üniversitesi'nin resmi Erasmus web sayfası, başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve burs olanakları hakkında kapsamlı bilgiler içermektedir. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.internationalstudents.cam.ac.uk",
        "",
        ""
      ],
      [
        "London Imperial College, mükemmeliyetçilik ve yenilikçilik anlayışıyla öne çıkan, dünya çapında saygın bir üniversitedir. Erasmus Programı ile London Imperial College'ın sunduğu eğitim imkanlarından yararlanabilirsiniz. London Imperial College'ın resmi Erasmus web sayfası, başvuru süreci, destek ve danışmanlık hizmetleri, Erasmus hibe ve burs olanakları hakkında ayrıntılı bilgilere erişebilirsiniz. İlgili link için ",
        "buraya tıklayabilirsiniz.",
        "www.imperial.ac.uk",
        "",
        "/study/international-students/",
      ],
    ],
  ];

  // Her hangi bir url'i açmak için kullanılabilir.
  Future<void> _launchUrl(String url, String path) async {
    final Uri uri = Uri(scheme: "https", host: url, path: path);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 247, 235, 225),
        backgroundColor: Color.fromARGB(255, 247, 235, 225),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BottomNavigation();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 247, 235, 225),
      body: ListView(
        children: [
          SizedBox(height: 30),
          buildDivider(),
          buildDropdownMenu(0, 'İstanbul Teknik Üniversitesi',
              'Orta Doğu Teknik Üniversitesi', 'Boğaziçi Üniversitesi'),
          buildDivider(),
          SizedBox(height: 20),
          buildDivider(),
          buildDropdownMenu(1, 'Boras Üniversitesi', 'Uppsala Üniversitesi',
              'Stockholm Üniversitesi'),
          buildDivider(),
          SizedBox(height: 20),
          buildDivider(),
          buildDropdownMenu(2, 'Bologna Üniversitesi', 'Milano Üniversitesi',
              'Rome La Sapienza Üniversitesi'),
          buildDivider(),
          SizedBox(height: 20),
          buildDivider(),
          buildDropdownMenu(3, 'Münih Teknik Üniversitesi',
              'Berlin Teknik Üniversitesi', 'Stuttgart Üniversitesi'),
          buildDivider(),
          SizedBox(height: 20),
          buildDivider(),
          buildDropdownMenu(4, 'Oxford Üniversitesi', 'Cambridge Üniversitesi',
              'London Imperial Üniversitesi'),
          buildDivider(),
        ],
      ),
    );
  }

  Widget buildDropdownMenu(
      int index, String option1, String option2, String option3) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              'assets/images/flags_$index.png',
            ),
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              countryNames[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          trailing: Icon(
            dropdownOpenState[index]
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          onTap: () {
            setState(() {
              dropdownOpenState[index] = !dropdownOpenState[index];
            });
          },
        ),
        if (dropdownOpenState[index]) ...[
          buildElevatedButton(option1, countryNames[index], index, 0, 0),
          buildElevatedButton(option2, countryNames[index], index, 1, 0),
          buildElevatedButton(option3, countryNames[index], index, 2, 0),
        ],
      ],
    );
  }

  Widget buildElevatedButton(
      String text, String countryName, int index, int text1, int text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 60),
                  child: AlertDialog(
                    contentPadding: EdgeInsets.all(24),
                    backgroundColor: Color.fromARGB(255, 189, 104, 28),
                    content: SingleChildScrollView(
                      child: Container(
                        width: double.maxFinite,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              text,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: universityContent[index][text1]
                                                  [text2]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: universityContent[index][text1]
                                                  [text2 + 1]
                                              .toString(),
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 66, 139, 193),
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Color.fromARGB(
                                                255, 66, 139, 193),
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              await _launchUrl(
                                                  universityContent[index]
                                                      [text1][text2 + 2],
                                                  universityContent[index]
                                                      [text1][text2 + 4]);
                                            },
                                        ),
                                        TextSpan(
                                          text: universityContent[index][text1]
                                                  [text2 + 3]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.check, color: Colors.transparent),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.black,
                size: 30,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 252, 198, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Divider(
        color: Colors.black,
        thickness: 1,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: SchoolsPage()));
}
