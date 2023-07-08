import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageListPage extends StatefulWidget {
  @override
  _ImageListPageState createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    firebase_storage.ListResult result =
        await firebase_storage.FirebaseStorage.instance.ref().listAll();
    final List<firebase_storage.Reference> allFiles = result.items;

    List<String> urls = [];

    for (var ref in allFiles) {
      String downloadURL = await ref.getDownloadURL();
      urls.add(downloadURL);
    }

    setState(() {
      imageUrls = urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Image.network(
              imageUrls[index],
              height: 200,
            ),
          );
        },
      ),
    );
  }
}
