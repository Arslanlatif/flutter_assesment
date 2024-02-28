import 'package:fluter_assesment/pageView.dart';
import 'package:fluter_assesment/storyViewer.dart';
import 'package:flutter/material.dart';

import 'bottom_navigationbar.dart';

class Ui extends StatefulWidget {
  const Ui({super.key});

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 226, 236),
        title: const Text('blueble', style: TextStyle(color: Colors.blue)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined,
                  color: Colors.black)),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  color: const Color.fromARGB(255, 255, 226, 236),
                  child: const StoryViewer())),
          Container(
              color: const Color.fromARGB(255, 255, 226, 236),
              height: MediaQuery.sizeOf(context).height * 0.03),
          const Flexible(flex: 8, child: PageViewer())
        ],
      ),
      bottomNavigationBar: const NavigationButtom(),
    );
  }
}
