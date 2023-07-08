import 'package:erasmus_connect/screens/homepage/main_screen/education_community_page/image_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  final picker = ImagePicker();
  PickedFile? _imageFile;
  String? downloadUrl;
  List<String> imageUrls = [];

  Future chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile != null ? PickedFile(pickedFile.path) : null;
    });
  }

  Future uploadImage() async {
    if (_imageFile != null) {
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child(
                'images/${DateTime.now().toString()}',
              );
      firebase_storage.UploadTask uploadTask = ref.putFile(
        File(_imageFile!.path),
      );

      firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() {});

      downloadUrl = await ref.getDownloadURL();
      print('Image uploaded. Download URL: $downloadUrl');
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('imageUrls', imageUrls);
      // TODO: Store the download URL in a database or use it as needed
      imageUrls.add(downloadUrl!);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    // Retrieve image URLs from shared preferences
    retrieveImageUrls();
  }

  Future<void> retrieveImageUrls() async {
    final prefs = await SharedPreferences.getInstance();
    final storedImageUrls = prefs.getStringList('imageUrls');
    if (storedImageUrls != null) {
      setState(() {
        imageUrls = storedImageUrls;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _imageFile == null
                  ? Text('No image selected')
                  : Image.file(
                      File(_imageFile!.path),
                      height: 200,
                    ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: chooseImage,
                child: Text('Select Image'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: uploadImage,
                child: Text('Upload Image'),
              ),
              Container(
                child: downloadUrl != null
                    ? Image.network(downloadUrl!)
                    : Text('Image will be displayed here'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ImageListPage(imageUrls: imageUrls)),
                  );
                },
                child: Text('Image List'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageListPage extends StatefulWidget {
  final List<String> imageUrls;

  ImageListPage({required this.imageUrls});

  @override
  State<ImageListPage> createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  void deleteImage(int index) async {
    // Remove the image URL from the list
    widget.imageUrls.removeAt(index);

    // Update the shared preferences with the updated list
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('imageUrls', widget.imageUrls);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List'),
      ),
      body: ListView.builder(
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(widget.imageUrls[index]),
            title: Text('Image $index'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteImage(index);
              },
            ),
          );
        },
      ),
    );
  }
}
