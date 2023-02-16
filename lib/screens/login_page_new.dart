import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final emailRecuperation = TextEditingController();

  bool isLogin = true;
  bool loading = false;

  late String titulo;
  late String tituloCard;
  late String description;
  late Widget actionButton;
  late String toggleButton;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo!';
        description =
            'Aqui você gerencia seus seguros e do seus familiares em poucos cliques.';
        tituloCard = 'Entrar';
        actionButton = Image.asset(
          "arrowIcon.png",
          color: Colors.white,
        );
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        description = 'Para se cadastrar preencha o formulário abaixo:';
        tituloCard = 'Cadastrar';
        actionButton = Image.asset(
          "checkIcon.png",
          color: Colors.white,
        );

        toggleButton = 'Voltar ao Login.';
      }
    });
  }

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red))));
    }
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red))));
    }
  }

  Future<void> _forgetPasswordAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: const EdgeInsets.only(bottom: 10, right: 20),
          title: const Text('Esquceu a senha?',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF72c58e))),
          backgroundColor: const Color(0xFF23212a),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                    'Escreva seu email abaixo para a recuperação da senha',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: emailRecuperation,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF72c58e), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        label: const Center(
                          child: Text("Digite seu e-mail"),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {}
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Enviar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF72c58e))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color(0xFF00a4a3),
                    Color(0xFF72c58e),
                    Color(0xFFdbde7c),
                  ],
                  tileMode: TileMode.mirror,
                )),
                child: Container(
                  color: Colors.transparent,
                  height: 20,
                  child: Column(
                    children: [
                      Image.asset(
                        "logo.png",
                        width: 150,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 25),
                        child: Text(
                          titulo,
                          style: const TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          description,
                          style: const TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 320,
                color: Colors.black87,
                child: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 230),
                        child: Text("Acesse através das redes sociais",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "google.png",
                              width: 30,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Image.asset(
                                "facebook.png",
                                width: 25,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Image.asset(
                                "twitter.png",
                                width: 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 100),
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Container(
                  width: 500,
                  height: 400,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 1.1,
                          spreadRadius: 2.2,
                          offset: Offset(
                            1.1,
                            0.1,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF23212a)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 10, left: 30),
                            child: Center(
                              child: Text(
                                tituloCard,
                                style: const TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF72c58e),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: email,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF72c58e), width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: const Center(
                                child: Text("Email"),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o email corretamente!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: senha,
                          obscureText: true,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF72c58e), width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: const Center(
                                child: Text("Senha"),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informa sua senha!';
                            } else if (value.length < 6) {
                              return 'Sua senha deve ter no mínimo 6 caracteres';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextButton(
                          onPressed: () => setFormAction(!isLogin),
                          child: Text(toggleButton,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: Color(0xFF72c58e),
                                  ),
                                ),
                                Text(
                                  "Lembrar sempre",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            child: InkWell(
                              onTap: _forgetPasswordAlertDialog,
                              child: const Text(
                                "Esqueceu a senha?",
                                style: TextStyle(
                                    color: Color(0xFF72c58e), fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 490, left: 5),
                child: InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (isLogin) {
                        login();
                      } else {
                        registrar();
                      }
                    }
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                            Color(0xFF00a4a3),
                            Color(0xFF72c58e),
                            Color(0xFFdbde7c),
                          ],
                          tileMode: TileMode.mirror,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black87,
                            blurRadius: 3.3, // soften the shadow
                            spreadRadius: 2.2, //extend the shadow
                            offset: Offset(
                              1.1, // Move to right 5  horizontally
                              0.1, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        border: Border.all(
                          color: const Color(0xFF23212a),
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ? [
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    child: actionButton,
                                  )),
                            ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
