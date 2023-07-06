//İSTANBUL TEKNİK ÜNİVERSİTESİ, ORTA DOĞU TEKNİK ÜNİVERSİTESİ, BOĞAZİÇİ ÜNİVERSİTESİ, BORAS ÜNİVERSİTESİ, UPPSALA ÜNİVERSİTESİ, STOCKHOLM ÜNİVERSİTESİ, BOLOGNA ÜNİVERSİTESİ, MİLANO ÜNİVERSİTESİ, ROME LA SAPİENZA ÜNİVERSİTESİ, MÜNİH TEKNİK ÜNİVERSİTESİ, BERLİN TEKNİK ÜNİVERSİTESİ, STUTTGART ÜNİVERSİTESİ, DELFT ÜNİVERSİTESİ, INHOLLAND ÜNİVERSİTESİ, HAGUE ÜNİVERSİTESİ,


// class ContainerList extends StatelessWidget {
//   final List<String> countryNames = [
//     'Türkiye',
//     'İsveç',
//     'İtalya',
//     'Almanya',
//     'Hollanda'
//   ];

//   final List<List<String>> visaContent = [
//     [
//       "Türkiye'ye giriş yapacak Erasmus öğrencileri, Türk Konsolosluğu veya Büyükelçiliği tarafından verilen öğrenci vizesi başvurusunda bulunmalıdır. Başvuru için gerekli belgeler arasında pasaport, kabul mektubu, seyahat sağlık sigortası ve mali durumu gösteren belgeler yer almaktadır.Detaylı bilgilere ",
//       "Türk Konsolosluğu/Büyükelçiliği",
//       "www.konsolosluk.gov.tr",
//       "/",
//       " internet sitesinden ulaşabilirsiniz.",
//     ],
//     [
//       "İsveç'e giriş yapacak Erasmus öğrencileri, İsveç Göçmenlik Kurumu (Migrationsverket) tarafından verilen öğrenci vizesi başvurusunda bulunmalıdır. Başvuru için gerekli belgeler arasında pasaport, kabul mektubu, seyahat sağlık sigortası ve mali durumu gösteren belgeler yer almaktadır. Detaylı bilgilere ",
//       "İsveç Göçmenlik Kurumu",
//       "www.migrationsverket.se",
//       "/",
//       " internet sitesinden ulaşabilirsiniz.",
//     ],
//     [
//       "İtalya'ya giriş yapacak Erasmus öğrencileri, İtalyan Konsolosluğu veya Büyükelçiliği tarafından verilen öğrenci vizesi başvurusunda bulunmalıdır. Başvuru için gerekli belgeler arasında pasaport, kabul mektubu, seyahat sağlık sigortası ve mali durumu gösteren belgeler yer almaktadır. Vize süreci ve başvuru detayları için ",
//       "İtalyan Konsolosluğu/Büyükelçiliği",
//       "vistoperitalia.esteri.it",
//       "/home/en",
//       " internet sitesini ziyaret edebilirsiniz.",
//     ],
//     [
//       "Almanya'ya giriş yapacak Erasmus öğrencileri, Alman Konsolosluğu veya Büyükelçiliği'ne başvurmalı. Gerekli belgeler arasında pasaport, kabul mektubu, seyahat sağlık sigortası ve mali durumu gösteren belgeler bulunmaktadır. Türkiye’de İtalya ve Almanya vize başvuruları için görevlendirilmiş tek kurum olan ",
//       "İDATA",
//       "www.idata.com.tr",
//       "/",
//       " üzerinden başvuru yapabilirsiniz.",
//     ],
//     [
//       "Hollanda'ya giriş yapacak Erasmus öğrencileri, Hollanda Göçmenlik ve Vatandaşlık Departmanı (IND) tarafından verilen öğrenci vizesi başvurusunda bulunmalıdır. Başvuru için gereken belgeler arasında pasaport, kabul mektubu, seyahat sağlık sigortası ve mali durumu gösteren belgeler yer almaktadır. (",
//       "https://ind.nl/",
//       "ind.nl",
//       "/",
//       " ) Bu site üzerinden Erasmus öğrencileri için vize başvurusuyla ilgili detaylı bilgilere, gerekli belgelere ve başvuru prosedürüne erişebilirsiniz.",
//     ],
//   ];

//   // Her hangi bir url'i açmak için kullanılabilir.
//   Future<void> _launchUrl(String url, String path) async {
//     final Uri uri = Uri(scheme: "https", host: url, path: path);

//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw Exception('Could not launch $uri');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             return Container(
//               constraints: BoxConstraints(
//                 minHeight: constraints.maxHeight,
//               ),
//               margin: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(24.0),
//                 color: Colors.white,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     child: Padding(
//                   padding: const EdgeInsets.only(bottom: 12),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       radius: 24,
//                       backgroundImage: AssetImage(
//                         'assets/images/flags_$index.png',
//                       ),
//                     ),
//                     title: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         countryNames[index],
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(24.0),
//                     topRight: Radius.circular(24.0),
//                   ),
//                   color: Color.fromARGB(255, 255, 144, 34),
//                 ),
//                   ),
//                   SingleChildScrollView(
//                     padding: EdgeInsets.all(18.0),
//                     child: Container(
//                      width: double.maxFinite,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: visaContent[index][0].toString(),
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: visaContent[index][1].toString(),
//                                     style: TextStyle(
//                                       color: Color.fromARGB(255, 66, 139, 193),
//                                       decoration: TextDecoration.underline,
//                                       decorationColor:
//                                           Color.fromARGB(255, 66, 139, 193),
//                                     ),
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () async {
//                                         await _launchUrl(visaContent[index][2],
//                                             visaContent[index][3]);
//                                       },
//                                   ),
//                                   TextSpan(
//                                     text: visaContent[index][4].toString(),
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
