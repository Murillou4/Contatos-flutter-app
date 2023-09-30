//Dedico esse a minha mulher - Heloisa

import 'package:flutter/material.dart';
import 'contato.dart';
import 'sqlitemanager.dart';

List<Container> contatosFavWidgets = [];
List<Container> contatosWidgets = [];
var contatos = [];

Future<void> main() async {
  // Inicializa o banco de dados antes de iniciar o aplicativo
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DBHelper();
  await dbHelper.initDatabase();
  contatos = await dbHelper.getContatos();
  contatos.forEach((contato) {
    contatosWidgets.add(contato.contatoWidget());
  });
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Busca()),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Favoritos(),
          ),
          Contatos(),
        ],
      ),
    ));
  }
}

class Busca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 340,
          height: 46,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.search,
                      color: Color.fromRGBO(84, 95, 113, 1),
                      size: 25,
                    ),
                  ),
                  SizedBox(
                    child: Center(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Pesquisar contatos e números...',
                          hintStyle: TextStyle(
                            color: Colors
                                .grey, // Altere a cor da dica conforme necessário
                          ),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {},
                      ),
                    ),
                    width: 200,
                    height: 38,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Row(children: [
                      Icon(
                        Icons.mic,
                        color: Color.fromRGBO(84, 95, 113, 1),
                        size: 25,
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Color.fromRGBO(84, 95, 113, 1),
                        size: 25,
                      ),
                    ]),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}

class Favoritos extends StatefulWidget {
  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Favoritos',
              style: TextStyle(
                color: Color(0xFF545F71),
                fontSize: 15,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contatosFavWidgets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: contatosFavWidgets[index],
                  onTap: () {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Contatos extends StatefulWidget {
  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Todos',
              style: TextStyle(
                color: Color(0xFF545F71),
                fontSize: 15,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height - 400,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: contatosWidgets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: contatosWidgets[index],
                  onTap: () {
                    print('llllllll');
                    setState(() {
                      if (contatosFavWidgets.length > 4) {
                        contatosFavWidgets.removeAt(0);
                        contatosFavWidgets.add(contatos.elementAt(index).contatoWidgetFav());
                      } else {
                        contatosFavWidgets.add(contatosWidgets[index]);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
