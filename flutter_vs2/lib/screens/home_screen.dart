import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int currentPage = 1;
  final PageController pageController = new PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hola mundo $currentPage'),
        elevation: 10,
      ),

      /* body: currentPage == 0
          ? CustomScreen(color: Colors.pink)
          : currentPage == 1
              ? CustomScreen(color: Colors.indigo)
              : CustomScreen(color: Colors.purple),*/
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: const [
          CustomScreen(color: Colors.blue),
          CustomScreen(color: Colors.indigo),
          CustomScreen(color: Colors.pink)
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.delete_forever),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.deepPurple,
        elevation: 20,
      ),
      // * tabs
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;

          pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.easeOut);

          setState(() {});
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined), label: 'Usuario'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configuración'),
          BottomNavigationBarItem(
              icon: Icon(Icons.carpenter), label: 'carpenter')
        ],
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: const Center(
          child: Text('Custom Screen'),
        ));
  }
}
