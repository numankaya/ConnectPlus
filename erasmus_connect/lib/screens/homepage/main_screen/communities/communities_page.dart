import 'package:flutter/material.dart';

class CommunitiesPage extends StatefulWidget {
  final Function(int) goToPage;
  const CommunitiesPage({required this.goToPage, Key? key}) : super(key: key);

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}
//----------------------------------------------------------------------------------------------------

class _CommunitiesPageState extends State<CommunitiesPage> {
  final List<School> schools = [
    School(
      title: 'Stockholm Üniversitesi',
      country: 'İsveç',
      joinedPeople: 50,
      avatarUrls: [
        'assets/images/community_detail_img_1.png',
        'assets/images/community_img_4.png',
        'assets/images/community_img_5.png',
      ],
    ),
    School(
      title: 'Boğaziçi Üniversitesi',
      country: 'Türkiye',
      joinedPeople: 30,
      avatarUrls: [
        'assets/images/community_detail_img_2.png',
        'assets/images/community_img_4.png',
        'assets/images/community_img_5.png',
      ],
    ),
    School(
      title: 'Bologna Üniversitesi',
      country: 'İtalya',
      joinedPeople: 20,
      avatarUrls: [
        'assets/images/community_detail_img_3.png',
        'assets/images/community_img_4.png',
        'assets/images/community_img_5.png',
      ],
    ),
  ];
//----------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 235, 225),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(128, 255, 144, 34),
          foregroundColor: const Color.fromARGB(128, 255, 144, 34),
          surfaceTintColor: const Color.fromARGB(128, 255, 144, 34),
          shadowColor: const Color.fromARGB(128, 255, 144, 34),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {
                    widget.goToPage(2);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                'Topluluklar',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(12.0),
          itemCount: schools.length,
          itemBuilder: (BuildContext context, int index) {
            return ContainerCard(
              school: schools[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CommunityDetailsPage(school: schools[index]),
                  ),
                );
                print("index ===== >$index");
                print("school ===== >${schools[index]}");
              },
            );
          },
        ),
      ),
    );
  }
}

class School {
  final String title;
  final String country;
  final int joinedPeople;
  final List<String> avatarUrls;

  School({
    required this.title,
    required this.country,
    required this.joinedPeople,
    required this.avatarUrls,
  });
}
//----------------------------------------------------------------------------------------------------

class ContainerCard extends StatelessWidget {
  final School school;
  final VoidCallback onTap;

  ContainerCard({required this.school, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(90.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                school.avatarUrls[0],
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    school.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    school.country,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: const Color.fromARGB(255, 106, 106, 106),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(100, 20),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 81, 129, 184),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      'Katıl',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(school.avatarUrls[1]),
                      ),
                      SizedBox(width: 5.0),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(school.avatarUrls[2]),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '${school.joinedPeople} joined',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------------------------------
class CommunityDetailsPage extends StatelessWidget {
  final School school;

  CommunityDetailsPage({required this.school});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              school.avatarUrls[0],
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    school.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(school.avatarUrls[1]),
                      ),
                      SizedBox(width: 5.0),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(school.avatarUrls[2]),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '${school.joinedPeople} joined',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Leave Community'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Replace with actual post count
              itemBuilder: (BuildContext context, int index) {
                return PostCard(
                  post: Post(
                    imageUrl:
                        'assets/images/flags_$index.png', // Replace with actual image path
                    content:
                        'Lorem ipsum dolor sit amet', // Replace with actual post content
                    comments: 10, // Replace with actual comment count
                    upvotes: 50, // Replace with actual upvote count
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final String imageUrl;
  final String content;
  final int comments;
  final int upvotes;

  Post({
    required this.imageUrl,
    required this.content,
    required this.comments,
    required this.upvotes,
  });
}

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            post.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0),
          Text(post.content),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.comment),
              SizedBox(width: 5.0),
              Text(post.comments.toString()),
              SizedBox(width: 10.0),
              Icon(Icons.thumb_up),
              SizedBox(width: 5.0),
              Text(post.upvotes.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
