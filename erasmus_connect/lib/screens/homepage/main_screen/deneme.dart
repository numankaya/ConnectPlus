// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class EducationCommunityPage extends StatefulWidget {
//   final Function(int) goToPage;

//   const EducationCommunityPage({required this.goToPage, Key? key})
//       : super(key: key);

//   @override
//   _EducationCommunityPageState createState() => _EducationCommunityPageState();
// }

// class _EducationCommunityPageState extends State<EducationCommunityPage> {
//   final _fireStore = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   late User loggedInUser;

//   late PageController _pageController;
//   int _currentPage = 0;

//   List<Map<String, dynamic>> likedItems = [];

//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//     _pageController = PageController(initialPage: _currentPage);
//   }

//   void getCurrentUser() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         loggedInUser = user;
//         print(loggedInUser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void toggleLike(Map<String, dynamic> itemData) {
//     setState(() {
//       if (likedItems.contains(itemData)) {
//         likedItems.remove(itemData);
//       } else {
//         likedItems.add(itemData);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color.fromARGB(255, 247, 235, 225),
//         body: PageView.builder(
//           controller: _pageController,
//           onPageChanged: (int page) {
//             setState(() {
//               _currentPage = page;
//             });
//           },
//           itemCount: 2,
//           itemBuilder: (context, index) {
//             if (index == 0) {
//               return buildMainPage();
//             } else if (index == 1) {
//               return buildLikedItemsPage();
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildMainPage() {
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(35.0),
//               bottomRight: Radius.circular(35.0),
//             ),
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 255, 231, 160),
//                 Color.fromARGB(255, 251, 141, 39),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.center,
//             ),
//           ),
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.12,
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 30.0,
//                 backgroundImage: AssetImage('assets/images/flags_0.png'),
//               ),
//               SizedBox(width: 10.0),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Senin lokasyonun",
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                   Text(
//                     "İstanbul, Türkiye",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.location_pin,
//                   color: Color.fromARGB(255, 0, 186, 186),
//                 ),
//               ),
//               Spacer(),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: IconButton(
//                   onPressed: () => widget.goToPage(13),
//                   icon: Icon(
//                     size: 30.0,
//                     Icons.edit_document,
//                     color: Color.fromARGB(255, 101, 116, 116),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Expanded(
//           child: StreamBuilder<QuerySnapshot>(
//             stream: _fireStore
//                 .collection('events')
//                 .orderBy('created', descending: true)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     backgroundColor: Colors.lightBlueAccent,
//                   ),
//                 );
//               }
//               final educationCommunityPages = snapshot.data!.docs;

//               return ListView.builder(
//                 itemCount: educationCommunityPages.length,
//                 itemBuilder: (context, index) {
//                   final data = educationCommunityPages[index].data()
//                       as Map<String, dynamic>;
//                   final date = data['date'] ?? '';
//                   final place = data['place'] ?? '';
//                   final event = data['event'] ?? '';
//                   final time = data['time'] ?? '';
//                   final loggedIn = data['sender'] ?? '';
//                   final currentUser = loggedInUser.email ?? '';
//                   final isLiked = likedItems.contains(data);

//                   return MessageBubble(
//                     date: date,
//                     place: place,
//                     event: event,
//                     time: time,
//                     isLoggedIn: currentUser == loggedIn,
//                     isLiked: isLiked,
//                     onLikePressed: () => toggleLike(data),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildLikedItemsPage() {
//     return ListView.builder(
//       itemCount: likedItems.length,
//       itemBuilder: (context, index) {
//         final data = likedItems[index];
//         final date = data['date'] ?? '';
//         final place = data['place'] ?? '';
//         final event = data['event'] ?? '';
//         final time = data['time'] ?? '';
//         final loggedIn = data['sender'] ?? '';
//         final currentUser = loggedInUser.email ?? '';

//         return MessageBubble(
//           date: date,
//           place: place,
//           event: event,
//           time: time,
//           isLoggedIn: currentUser == loggedIn,
//           isLiked: true,
//           onLikePressed: () => toggleLike(data),
//         );
//       },
//     );
//   }
// }

// class MessageBubble extends StatelessWidget {
//   MessageBubble({
//     required this.isLoggedIn,
//     required this.isLiked,
//     required this.date,
//     required this.event,
//     required this.time,
//     required this.place,
//     required this.onLikePressed,
//   });

//   final bool isLoggedIn;
//   final bool isLiked;
//   final String date;
//   final String event;
//   final String time;
//   final String place;
//   final VoidCallback onLikePressed;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         // ...existing code for MessageBubble
//         );
//   }
// }

// Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(35.0),
//               bottomRight: Radius.circular(35.0),
//             ),
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 255, 231, 160),
//                 Color.fromARGB(255, 251, 141, 39),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.center,
//             ),
//           ),
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.12,
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 30.0,
//                 backgroundImage: AssetImage('assets/images/flags_0.png'),
//               ),
//               SizedBox(width: 10.0),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Senin lokasyonun",
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                   Text(
//                     "İstanbul, Türkiye",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.location_pin,
//                   color: Color.fromARGB(255, 0, 186, 186),
//                 ),
//               ),
//               Spacer(),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: IconButton(
//                   onPressed: () => widget.goToPage(13),
//                   icon: Icon(
//                     size: 30.0,
//                     Icons.edit_document,
//                     color: Color.fromARGB(255, 101, 116, 116),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),

// return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             'assets/images/turkey_accommodation.png',
//             fit: BoxFit.fill,
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: MediaQuery.of(context).size.height * 0.3,
//           ),
//           Positioned(
//             top: MediaQuery.of(context).size.height * 0.01,
//             right: MediaQuery.of(context).size.width * 0.06,
//             child: IconButton(
//               onPressed: onLikePressed,
//               icon: Icon(
//                 isLiked ? Icons.favorite : Icons.favorite_border,
//                 color: isLiked ? Colors.red : Colors.black,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: MediaQuery.of(context).size.height * 0.02,
//             left: MediaQuery.of(context).size.width * 0.06,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Color.fromARGB(0, 0, 0, 0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     event,
//                     style: TextStyle(
//                       shadows: [
//                         Shadow(
//                           blurRadius: 5.0,
//                           color: Colors.black,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.location_on,
//                         color: Color.fromARGB(255, 0, 186, 186),
//                       ),
//                       SizedBox(width: 5),
//                       Expanded(
//                         child: Text(
//                           place,
//                           style: TextStyle(
//                             shadows: [
//                               Shadow(
//                                 blurRadius: 5.0,
//                                 color: Colors.black,
//                                 offset: Offset(2.0, 2.0),
//                               ),
//                             ],
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     '$time $date',
//                     style: TextStyle(
//                       shadows: [
//                         Shadow(
//                           blurRadius: 5.0,
//                           color: Colors.black,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/flags_1.png'),
//                         radius: 10,
//                       ),
//                       SizedBox(width: 8),
//                       CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/flags_2.png'),
//                         radius: 10,
//                       ),
//                       SizedBox(width: 8),
//                       CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/flags_3.png'),
//                         radius: 10,
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         '+5',
//                         style: TextStyle(
//                           shadows: [
//                             Shadow(
//                               blurRadius: 5.0,
//                               color: Colors.black,
//                               offset: Offset(2.0, 2.0),
//                             ),
//                           ],
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );

// Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             'assets/images/turkey_accommodation.png',
//             fit: BoxFit.fill,
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: MediaQuery.of(context).size.height * 0.3,
//           ),
//           Positioned(
//             top: MediaQuery.of(context).size.height * 0.01,
//             right: MediaQuery.of(context).size.width * 0.06,
//             child: IconButton(
//               onPressed: onLikePressed,
//               icon: Icon(
//                 isLiked ? Icons.favorite : Icons.favorite_border,
//                 color: isLiked ? Colors.red : Colors.black,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: MediaQuery.of(context).size.height * 0.02,
//             left: MediaQuery.of(context).size.width * 0.06,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Color.fromARGB(0, 0, 0, 0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     event,
//                     style: TextStyle(
//                       shadows: [
//                         Shadow(
//                           blurRadius: 5.0,
//                           color: Colors.black,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.location_on,
//                         color: Color.fromARGB(255, 0, 186, 186),
//                       ),
//                       SizedBox(width: 5),
//                       Expanded(
//                         child: Text(
//                           place,
//                           style: TextStyle(
//                             shadows: [
//                               Shadow(
//                                 blurRadius: 5.0,
//                                 color: Colors.black,
//                                 offset: Offset(2.0, 2.0),
//                               ),
//                             ],
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     '$time $date',
//                     style: TextStyle(
//                       shadows: [
//                         Shadow(
//                           blurRadius: 5.0,
//                           color: Colors.black,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/flags_1.png'),
//                         radius: 10,
//                       ),
//                       SizedBox(width: 8),
//                       CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/flags_2.png'),
//                         radius: 10,
//                       ),
//                       SizedBox(width: 8),
//                       CircleAvatar(
//                         backgroundImage:
//                             AssetImage('assets/images/flags_3.png'),
//                         radius: 10,
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         '+5',
//                         style: TextStyle(
//                           shadows: [
//                             Shadow(
//                               blurRadius: 5.0,
//                               color: Colors.black,
//                               offset: Offset(2.0, 2.0),
//                             ),
//                           ],
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class EventListPage extends StatefulWidget {
//   @override
//   _EventListPageState createState() => _EventListPageState();
// }

// class _EventListPageState extends State<EventListPage> {
//   List<Event> events = [];

//   Future<void> fetchEvents() async {
//     final apiKey = 'M4IXPOJODGO4AAUVZIN3';
//     final url =
//         'https://www.eventbriteapi.com/v3/users/me/?token=M4IXPOJODGO4AAUVZIN3';
//     try {
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {'Authorization': 'Bearer $apiKey'},
//       );

//       if (response.statusCode == 200) {
//         final responseData = json.decode(response.body);
//         if (responseData.containsKey('events')) {
//           setState(() {
//             events = Event.fromJsonList(responseData['events']);
//           });
//         } else {
//           print('Error: Events not found in API response.');
//         }
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchEvents();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Event List'),
//       ),
//       body: ListView.builder(
//         itemCount: events.length,
//         itemBuilder: (context, index) {
//           final event = events[index];
//           return ListTile(
//             title: Text(event.name),
//             subtitle: Text(event.startDate),
//             onTap: () {
//               // Add any action you want when an event is tapped
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class Event {
//   final String name;
//   final String startDate;

//   Event({required this.name, required this.startDate});

//   factory Event.fromJson(Map<String, dynamic> json) {
//     return Event(
//       name: json['name']['text'],
//       startDate: json['start']['local'],
//     );
//   }

//   static List<Event> fromJsonList(List<dynamic> jsonList) {
//     return jsonList.map((json) => Event.fromJson(json)).toList();
//   }
// }

// class CommunityDetailsPage extends StatefulWidget {
//   final School school;

//   CommunityDetailsPage({required this.school});

//   @override
//   _CommunityDetailsPageState createState() => _CommunityDetailsPageState();
// }

// class _CommunityDetailsPageState extends State<CommunityDetailsPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _postTitle = '';
//   String _postContent = '';
//   String _postImageUrl = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Existing code...

//             SizedBox(height: 10.0),

//             // Create Post Form
//             Form(
//               key: _formKey,
//               child: Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Create Post',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18.0,
//                       ),
//                     ),
//                     SizedBox(height: 10.0),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Title',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a title';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _postTitle = value ?? '';
//                       },
//                     ),
//                     SizedBox(height: 10.0),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Content',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the content';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _postContent = value ?? '';
//                       },
//                     ),
//                     SizedBox(height: 10.0),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Image URL',
//                       ),
//                       onSaved: (value) {
//                         _postImageUrl = value ?? '';
//                       },
//                     ),
//                     SizedBox(height: 10.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save();

//                           // Create a new Post object
//                           final post = Post(
//                             title: _postTitle,
//                             content: _postContent,
//                             imageUrl: _postImageUrl,
//                             comments: 0,
//                             upvotes: 0,
//                             time: DateTime.now(),
//                           );

//                           // Save the post to Firebase
//                           savePostToFirebase(post);

//                           // Reset the form
//                           _formKey.currentState!.reset();
//                         }
//                       },
//                       child: Text('Create'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Existing code...
//           ],
//         ),
//       ),
//     );
//   }

//   void savePostToFirebase(Post post) {
//     final communityCollection =
//         FirebaseFirestore.instance.collection(widget.school.title);

//     communityCollection.add({
//       'title': post.title,
//       'content': post.content,
//       'imageUrl': post.imageUrl,
//       'comments': post.comments,
//       'upvotes': post.upvotes,
//       'time': post.time,
//     }).then((value) {
//       print('Post added to Firebase');
//     }).catchError((error) {
//       print('Failed to add post: $error');
//     });
//   }
// }
