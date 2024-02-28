import 'package:flutter/material.dart';

class StoryViewer extends StatefulWidget {
  const StoryViewer({super.key});

  @override
  State createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildCircularImageContainer('assets/images/person.jpg'),
      _buildCircularImageContainer('assets/images/person1.jpg'),
      _buildCircularImageContainer('assets/images/person2.jpg'),
      _buildCircularImageContainer('assets/images/person.jpg'),
      _buildCircularImageContainer('assets/images/person1.jpg')
    ]);
  }
}

Container _buildCircularImageContainer(String imagePath) {
  return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: const LinearGradient(
              colors: [Colors.red, Colors.blue, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 3, color: Colors.transparent)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(imagePath, fit: BoxFit.cover))));
}
