import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 235, 225),
        appBar: AppBar(
          shadowColor: Color.fromARGB(255, 247, 235, 225),
          backgroundColor: Color.fromARGB(255, 255, 144, 34),
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
                      
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 70),
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("Mentorlar")),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        filled: true,
                        fillColor: Color.fromARGB(255, 250, 229, 210),
                        hintText: 'Ara...',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 237, 164, 126),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 237, 164, 126),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        // Handle search bar input
                      },
                      autofocus: false,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 250, 229,
                          210), // Background color of the button
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        // Add your onTap logic here
                      },
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Image.asset(
                          'assets/images/filter_img.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.lightBlue,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          FastDMUserContainer(),
                          FastDMUserContainer(),
                          FastDMUserContainer(),
                          FastDMUserContainer(),
                          FastDMUserContainer(),
                          FastDMUserContainer(),
                          FastDMUserContainer(),
                          FastDMUserContainer(),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            DMUserMessageContainer(),
          ],
        ),
      ),
    );
  }
}

class FastDMUserContainer extends StatelessWidget {
  const FastDMUserContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage("assets/images/Default_pp.png"),
                fit: BoxFit.cover
              ),
              border: Border.all(color: Colors.black, width: 1)
            ),
          ),
          Text("Berk Çiçekler", style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12,fontWeight: FontWeight.bold, color: Color.fromRGBO(64, 58, 122, 1)), maxLines: 1,)
        ],
      ),
    );
  }
}

class DMUserMessageContainer extends StatelessWidget {
  const DMUserMessageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    return Container(
      width: width * 0.99,
      height: 80,
      color: Colors.deepOrange,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage("assets/images/Default_pp.png"),
                    fit: BoxFit.cover
                ),
                border: Border.all(color: Colors.black, width: 1)
            ),
          ),
        ],
      ),
    );
  }
}
