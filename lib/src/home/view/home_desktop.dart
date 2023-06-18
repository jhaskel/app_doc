
import 'package:app_doc/src/utils/widgets/texxto.dart';
import 'package:flutter/material.dart';



class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  int selectedPage = 0;

  final pages = [PageOne(), PageTwo(),PageThree(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Texxto(text: "ORSE",),
      ),
   //   drawer: MenuDrawer(),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedPage,
          fixedColor: Colors.blueAccent,
          unselectedItemColor: Color(0xFF757575),
          onTap: (position) {
            setState(() {
              selectedPage = position;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "protocolos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Ordem de Serviços"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Cadastro")
          ]),
    );
  }
}



// Page One
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.indigo,
      child: const Text(
        'Page 1',
        style: TextStyle(fontSize: 50, color: Colors.white),
      ),
    );
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: const Text(
          'Page 2',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ));
  }
}

// Page Three
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.amber,
        child: const Text(
          'Page 3',
          style: TextStyle(fontSize: 50, color: Colors.black),
        ));
  }
}