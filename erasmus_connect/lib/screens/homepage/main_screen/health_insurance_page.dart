import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class HealthInsurancePage extends StatefulWidget {
  final Function(int) goToPage;
  const HealthInsurancePage({required this.goToPage, Key? key})
      : super(key: key);

  @override
  _HealthInsurancePageState createState() => _HealthInsurancePageState();
}

class _HealthInsurancePageState extends State<HealthInsurancePage> {
  String selectedCountry = "Türkiye";
  List<String> countries = [
    'Türkiye',
    'İsveç',
    'İtalya',
    'Almanya',
    'Hollanda',
  ];

  Map<String, List<List<String>>> countryCardData = {
    'Türkiye': [
      [
        'assets/images/itu.png',
        'assets/images/odtu.png',
        'assets/images/boun.png',
      ],
      [
        'İstanbul Teknik Üniversitesi',
        'Orta Doğu Teknik Üniversitesi',
        'Boğaziçi Üniversitesi'
      ],
      [
        'afasdfasdf',
        'asdfadsf',
        'sfdgsdfgsdf',
      ],
    ],
    'İsveç': [
      [
        'assets/images/boras.png',
        'assets/images/uppsala.png',
        'assets/images/stockholm.png',
      ],
      [
        'Boras Üniversitesi',
        'Uppsala Üniversitesi',
        'Stockholm Üniversitesi',
      ],
      [
        'afascdfdfasdf',
        'asdfgfgdfadsf',
        'sfdgghfghsdfgsdf',
      ],
    ],
    'İtalya': [
      [
        'assets/images/bologna.png',
        'assets/images/milano.png',
        'assets/images/rome.png',
      ],
      [
        'Bologna Üniversitesi',
        'Milano Üniversitesi',
        'Rome La Sapienza Üniversitesi',
      ],
      [
        'afasdffghjfasdf',
        'asdfsdfgadsf',
        'sfdgsdfhfgjfgsdf',
      ],
    ],
    'Almanya': [
      [
        'assets/images/munih.png',
        'assets/images/berlin.png',
        'assets/images/stuttgart.png',
      ],
      [
        'Münih Teknik Üniversitesi',
        'Berlin Teknik Üniversitesi',
        'Stuttgart Üniversitesi',
      ],
      [
        'afadhgjdsersdfasdf',
        'asdrtrtfadsf',
        'sfdgsdfgıuılıusdf',
      ],
    ],
    'Hollanda': [
      [
        'assets/images/delft.png',
        'assets/images/inholland.png',
        'assets/images/hague.png',
      ],
      [
        'Delft Üniversitesi',
        'Inholland Üniversitesi',
        'Hague Üniversitesi',
      ],
      [
        'afasdfoııoasdf',
        'asdfrtwteradsf',
        'sfdgsdesdfgsdf',
      ],
    ],
  };

  int currentCardIndex = 0;

  void selectCountry(String country) {
    setState(() {
      selectedCountry = country;
      currentCardIndex = 0; // Reset the card index when switching countries
    });
  }

  Widget buildCards() {
    List<List<String>> currentCards = countryCardData[selectedCountry]!;
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      scrollDirection: Axis.horizontal,
      itemCount: currentCards[0].length,
      itemBuilder: (context, index) {
        String imageUrl = currentCards[0][index];
        String frontText = currentCards[1][index];
        String backText = currentCards[2][index];

        return FlipCard(
          front: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 255, 175, 131),
                  Color.fromARGB(255, 118, 61, 31),
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 255, 156, 102),
                      Color.fromARGB(255, 118, 61, 31),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 48.0, top: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, right: 12.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.sync,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      _buildCardContent(imageUrl),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          frontText,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          back: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 251, 241, 173),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Card(
                color: Color.fromARGB(255, 251, 241, 173),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      backText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
    );
  }

  Widget _buildCardContent(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.contain,
      ),
    );
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
                    widget.goToPage(2);
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
      body: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: countries.map((country) {
                final isSelected = selectedCountry == country;
                return Padding(
                  padding: EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () => selectCountry(country),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 32.0,
                        ), // Set desired padding here
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        isSelected
                            ? Color.fromARGB(255, 255, 169, 84)
                            : Color.fromARGB(255, 238, 217, 198),
                      ),
                    ),
                    child: Text(
                      country,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? Colors.white
                            : Color.fromARGB(255, 64, 58, 122),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: buildCards(),
          ),
        ],
      ),
    );
  }
}
