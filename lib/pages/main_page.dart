import 'package:dioapp/pages/dados_cadastrais.dart';
import 'package:flutter/material.dart';

import 'pagina1.dart';
import 'pagina2.dart';
import 'pagina3.dart';

//Tela main page
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  //Variavel
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Configurações")),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Dados cadastrais")),
                  onTap: () {
                    //navegação
                    Navigator.pop(context); //tira tela e coloca uma nova
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosCadastraisPage(
                                  texto: 'Meus dados',
                                  dados: ['Nome', 'Endereço'],
                                )));
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: const Text("Termos de uso e privacidade")),
                  onTap: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Pag1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Pag3", icon: Icon(Icons.person)),
                ])
          ],
        ),
      ),
    );
  }
}
