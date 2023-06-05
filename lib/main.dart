import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // useMaterial3: true,
      ),
      home: const BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  const BasicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("size: $size");
    print("platform: $platform");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon app basique'),
        leading: Icon(Icons.favorite),
        actions: [
          Icon(Icons.handyman),
          Icon(Icons.border_color),
        ],
        elevation: 15,
      ),
      body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          // margin: EdgeInsets.all(20.0),
          // padding: const EdgeInsets.only(top: 150),
          child: Center(
            child: Card(
              elevation: 7.5,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: SingleChildScrollView(
                  // scrollDirection: Axis.vertical,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Texte de la colonne"),
                        Stack(alignment: Alignment.topCenter, children: [
                          fromAsset(height: 200, width: size.width),
                          Padding(
                            padding: EdgeInsets.only(top: 160),
                            child: profilPicture(radius: 40),
                          ),
                          const Row(children: [
                            Icon(Icons.favorite),
                            Icon(Icons.border_color),
                            Spacer(),
                            Text("Un autre  élément"),
                          ]),
                        ]),
                        const Divider(
                          color: Colors.teal,
                          height: 10,
                          thickness: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 200,
                          width: size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/beach.jpg"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.yellow,
                                  offset: Offset(
                                    3,
                                    3,
                                  ),
                                  blurRadius: 2,
                                  spreadRadius: 5,
                                ),
                              ],
                              // shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Text("Container"),
                        ),
                        Container(
                          color: Colors.teal,
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              profilPicture(radius: 50),
                              // fromAsset(height: 80, width: 80),
                              Expanded(child: simpleText("Mohamed sangare"))
                              // fromNetwork(),
                            ],
                          ),
                        ),
                        fromNetwork(),
                        spanDemo(),
                        fromNetwork(),
                      ]),
                ),
              ),
            ),
          )),
    );
  }

  CircleAvatar profilPicture({double radius = 0}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
      foregroundImage: NetworkImage(
          "https://images.pexels.com/photos/1576955/pexels-photo-1576955.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Image fromAsset({double height = 0, double width = 0}) {
    return Image.asset(
      "images/beach.jpg",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

  Image fromNetwork() {
    return Image.network(
      "https://images.pexels.com/photos/1576955/pexels-photo-1576955.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      height: 200,
    );
  }

  Text spanDemo() {
    return const Text.rich(
        TextSpan(text: "Salut", style: TextStyle(color: Colors.red), children: [
      TextSpan(
        text: "second style",
        style: TextStyle(fontSize: 30, color: Colors.grey),
      ),
      TextSpan(
        text: "A l'infinit",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.blue,
        ),
      )
    ]));
  }
}
