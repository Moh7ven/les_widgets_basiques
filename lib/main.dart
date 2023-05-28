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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
      body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          // margin: EdgeInsets.all(20.0),
          // padding: const EdgeInsets.only(top: 150),
          child: Center(
              child: Image.network(
            "https://images.pexels.com/photos/1576955/pexels-photo-1576955.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
            // color: Colors.black,
            height: 150,
            width: 300,
            fit: BoxFit.cover,
          ))),
    );
  }

  Text simpleText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.right,
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
