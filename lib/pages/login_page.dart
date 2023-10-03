import 'package:dioapp/pages/main_page.dart';
import 'package:flutter/material.dart';

//Tela de login em blocos
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variavel email e senha
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");

  //variavel do visibility_off
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(135, 0, 0, 0),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 5,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Faça seu login e make the change_",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: -3),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        hintText: "E-mail:",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 167, 39, 189),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    controller: passwordController,
                    obscureText:
                        isObscureText, //deixa a senha escondida com valor true
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: -3),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        hintText: "Password:",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.purple,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.purple,
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          //simulando a entrada de login e navegação entre telas
                          if (emailController.text.trim() ==
                                  "davydcristiano@email.com" &&
                              passwordController.text.trim() == "123456789") {
                            //navigator navegação entre telas
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Erro ao efetuar o login!")));
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 167, 39, 189),
                            )),
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  //color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Esqueci minha senha",
                      style: TextStyle(
                          color: Colors.yellow, fontWeight: FontWeight.w400)),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  //color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text("Criar conta",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
