import 'package:erasmus_connect/screens/homepage/main_screen/education_community_page/upload.dart';
import 'package:flutter/material.dart';

class EducationCommunityPage extends StatelessWidget {
  final Function(int) goToPage;
  const EducationCommunityPage({required this.goToPage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education Community'),
      ),
      body: const Upload(),
    );
  }
}
