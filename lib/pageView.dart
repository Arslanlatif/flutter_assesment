import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PageViewer extends StatefulWidget {
  const PageViewer({super.key});

  @override
  State createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Tabs
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildTab("Following", 0), _buildTab("For You", 1)]),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 240, 234, 234),
            ),
            child: const Center(
              child: Text(
                'Chat',
                style: TextStyle(color: Color.fromARGB(255, 97, 88, 88)),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 240, 234, 234),
            ),
            child: const Center(
              child: Text(
                'Dance',
                style: TextStyle(color: Color.fromARGB(255, 97, 88, 88)),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 240, 234, 234),
            ),
            child: const Center(
              child: Text(
                'Learn',
                style: TextStyle(color: Color.fromARGB(255, 97, 88, 88)),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 240, 234, 234),
            ),
            child: const Center(
              child: Text(
                'Laugh',
                style: TextStyle(color: Color.fromARGB(255, 97, 88, 88)),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      // PageView
      Flexible(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
            Center(child: _buildFollowingWidgets()),
            Center(child: _buildForYouWidgets())
          ]))
    ]);
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
        onTap: () {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        },
        child: Container(
            width: 177,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
                color: _currentPageIndex == index
                    ? const Color.fromARGB(255, 255, 230, 238)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Text(title,
                style: TextStyle(
                    color: _currentPageIndex == index
                        ? Colors.black
                        : Colors.black,
                    fontWeight: FontWeight.bold))));
  }

  Widget _buildForYouWidgets() {
    return const Column(children: [GrideView()]);
  }

  Widget _buildFollowingWidgets() {
    return const Column(children: [GrideView()]);
  }
}

class GrideView extends StatelessWidget {
  const GrideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        pattern: [
          const WovenGridTile(1),
          const WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _buildGridItem(context, index),
      ),
    ));
  }

  Widget _buildGridItem(BuildContext context, int index) {
    List<String> imageUrls = [
      'assets/images/person.jpg',
      'assets/images/person1.jpg',
      'assets/images/person2.jpg',
      'assets/images/person.jpg',
      'assets/images/person2.jpg',
      'assets/images/person1.jpg',
      'assets/images/person.jpg',
      'assets/images/person1.jpg',
      'assets/images/person.jpg'
    ];

    return Column(
      children: [
        Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: const Color.fromARGB(255, 179, 34, 34),
            ),
            child: Flexible(
                child: Image.asset(
              imageUrls[index % imageUrls.length],
              fit: BoxFit.cover,
            ))),
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(children: [
              const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage(
                    'assets/images/person.jpg',
                  )),
              const SizedBox(width: 8.0),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('ALi ${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.location_on),
                    Text('Multan ${index + 1}',
                        style: const TextStyle(color: Colors.grey))
                  ],
                )
              ])
            ]))
      ],
    );
  }
}
