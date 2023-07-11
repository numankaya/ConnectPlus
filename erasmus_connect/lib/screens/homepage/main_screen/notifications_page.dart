import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final Function(int) goToPage;

  const NotificationsPage({required this.goToPage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 235, 225),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(128, 255, 144, 34),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Icon(
                  CupertinoIcons.chevron_back,
                  size: 24,
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  'Bildirimler',
                  style: TextStyle(
                    color: Color.fromARGB(255, 64, 58, 122),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_back,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<QuerySnapshot>>(
          future: getCollectionData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            final events = snapshot.data?[0].docs;
            final chat = snapshot.data?[1].docs;
            final community = snapshot.data?[2].docs;

            final allDocs = [...events!, ...chat!, ...community!];

            allDocs.sort((a, b) => (b['created'] as Timestamp)
                .compareTo(a['created'] as Timestamp));

            return ListView.separated(
              itemCount: allDocs.length,
              separatorBuilder: (context, index) => Divider(
                indent: 20,
                endIndent: 25,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              itemBuilder: (context, index) {
                final doc = allDocs[index];
                final collectionPath = doc.reference.parent?.path;
                final collectionName = collectionPath?.split('/').first ?? '';

                final place = doc['place'] as String? ?? '';
                final time = doc['time'] as String? ?? '';
                final eventTitle = doc['title'] as String? ?? '';
                final date = doc['date'] as String? ?? '';

                return ListTile(
                  leading: getIconForCollection(collectionName),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Place: $place\nDate: $date',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 118, 118, 118),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<QuerySnapshot>> getCollectionData() async {
    final eventsSnapshot = FirebaseFirestore.instance
        .collection('events')
        .orderBy('created', descending: true)
        .get();

    final chatSnapshot = FirebaseFirestore.instance.collection('chat').get();

    final communitySnapshot =
        FirebaseFirestore.instance.collection('community').get();

    return await Future.wait([eventsSnapshot, chatSnapshot, communitySnapshot]);
  }

  Icon getIconForCollection(String collectionName) {
    if (collectionName == 'events') {
      return Icon(Icons.favorite, color: Colors.red);
    } else if (collectionName == 'chat') {
      return Icon(Icons.chat);
    } else if (collectionName == 'community') {
      return Icon(Icons.group);
    } else {
      return Icon(Icons.error);
    }
  }
}
