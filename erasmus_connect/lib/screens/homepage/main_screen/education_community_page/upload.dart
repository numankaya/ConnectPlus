import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  XFile? xfile;

  void handleTakePhoto() async {
    xfile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    if (xfile != null) {
      File file = File(xfile!.path);
      setState(() {
        this.xfile = xfile;
      });
    }
    // Use the pickedImage as needed...
  }

  void handleChooseFromGallery() async {
    xfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 675,
      maxWidth: 960,
    );
    if (xfile != null) {
      File file = File(xfile!.path);
      setState(() {
        this.xfile = xfile;
      });
    }
    // Use the pickedImage as needed...
  }

  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: Text('Upload Image'),
          children: [
            SimpleDialogOption(
              child: Text('Photo with Camera'),
              onPressed: () => handleTakePhoto(),
            ),
            SimpleDialogOption(
              child: Text('Image from Gallery'),
              onPressed: () => handleChooseFromGallery(),
            ),
            SimpleDialogOption(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  buildUploadForm() {
    return Container(
      child: Column(
        children: [
          Text('Caption Text'),
          TextField(),
          Text('Location'),
          TextField(),
          Text('Add Tags'),
          TextField(),
          ElevatedButton(
            onPressed: () => print('Pressed'),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => selectImage(context),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: xfile == null
              ? Icon(Icons.add_a_photo)
              : Image.file(
                  File(xfile!.path),
                  fit: BoxFit.cover,
                  height: 300.0,
                  alignment: Alignment.topCenter,
                ),
        ),
      ],
    );
  }
}
