import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_firebase/utils/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isWeb = kIsWeb;

  Future<void> _exitAppAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: const EdgeInsets.only(bottom: 10, right: 20),
          title: const Text('Sair',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF72c58e))),
          backgroundColor: const Color(0xFF23212a),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Você deseja realmente sair de sua conta?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
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
              child: const Text('Sair',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF72c58e))),
              onPressed: () {
                context.read<AuthService>().logout();
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
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "logoTokio.png",
              width: 100,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.black12,
        elevation: 50.0,

        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black87,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text("Olá!",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const UserAccountsDrawerHeader(
              accountName: Text("PEDRO RUFFO",
                  style: TextStyle(
                    fontSize: 24,
                  )),
              accountEmail: Text("minha conta",
                  style: TextStyle(color: Color(0xFF72c58e), fontSize: 12)),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("user.png"),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/home'),
              child: ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
                title: const Text("Home/Seguros",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
                onTap: () {},
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Minhas Contratações",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Meus Sinistros",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Minha Familia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Meus Bens",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Pagamentos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Corretores",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Validar Boleto",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Telefones importantes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF72c58e)),
              title: const Text("Configurações",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  )),
              onTap: () {},
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: InkWell(
                onTap: _exitAppAlertDialog,
                child: const Text("Sair",
                    style: TextStyle(
                      color: Color(0xFF72c58e),
                      fontSize: 12,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
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
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 5),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "user.png",
                              width: 20,
                            ),
                          ),
                        ),
                        const Text(
                          'Dúvidas ?',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 13,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'Converse agora mesmo com a Tokio\ne tira suas dúvidas agora.',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 10,
                            color: Color(0xffffffff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "user.png",
                      width: 20,
                    ),
                  ),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "Bem-Vindo",
                          style: TextStyle(color: Colors.white54, fontSize: 11),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3, left: 10),
                        child: Text(
                          "Pedro Ruffo",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Cotar e Contratar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: InkWell(
                              /*
                                // WEBVIEW NA VERSÃO WEB ABRINDO NOVA ABA :

                                if (isWeb == kIsWeb) {
                                  js.context.callMethod('open', [
                                    'https://cotacoes.tokiomarine.com.br/massificados/auto/digital/front/#/home'
                                  ]);
                                } else {
                                // WEBVIEW NA VERSÃO MOBILE :

                                  Navigator.pushNamed(context, '/auto');
                                  }
                             */
                              onTap: () =>
                                  Navigator.pushNamed(context, '/auto'),
                              child: Container(
                                width: 90,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF2c2e38),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "auto.png",
                                        width: 100,
                                        color: const Color(0xFF72c58e),
                                      ),
                                    ),
                                    const Text(
                                      'Automóvel',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: Container(
                              width: 90,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF2c2e38),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "residencia.png",
                                      width: 40,
                                      color: const Color(0xFF72c58e),
                                    ),
                                  ),
                                  const Text(
                                    'Residência',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: Container(
                              width: 90,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF2c2e38),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "vida.png",
                                      width: 40,
                                      color: const Color(0xFF72c58e),
                                    ),
                                  ),
                                  const Text(
                                    'Vida',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: Container(
                              width: 90,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF2c2e38),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "acidente.png",
                                      width: 40,
                                      color: const Color(0xFF72c58e),
                                    ),
                                  ),
                                  const Text(
                                    'Acidentes\nPessoais',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: Container(
                              width: 90,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF2c2e38),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "moto.png",
                                      width: 45,
                                      color: const Color(0xFF72c58e),
                                    ),
                                  ),
                                  const Text(
                                    'Moto',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 5),
                            child: Container(
                              width: 90,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF2c2e38),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                  child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "empresa.png",
                                      width: 45,
                                      color: const Color(0xFF72c58e),
                                    ),
                                  ),
                                  const Text(
                                    'Empresa',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 15),
                      child: Row(
                        children: const [
                          Text(
                            "Minha Familia",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: const BoxDecoration(
                          color: Color(0xFF2c2e38),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Adicione aqui membros de sua familia e compartilhe os seguros com eles.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 15),
                      child: Row(
                        children: const [
                          Text(
                            "Contratados",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: const BoxDecoration(
                          color: Color(0xFF2c2e38),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Column(
                        children: [
                          Image.asset(
                            "carinha.png",
                            width: 45,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Você ainda não possui seguros contratados.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
