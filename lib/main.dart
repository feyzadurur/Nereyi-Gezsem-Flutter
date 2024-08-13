import 'package:flutter/material.dart';
import 'package:nereyi_gezsem_bbt/GirisYap.dart';
import 'package:nereyi_gezsem_bbt/Mesajlasma.dart';
import 'package:dart_openai/dart_openai.dart';


void main() {
  OpenAI.apiKey =
  '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';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GirisYap(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField()
          ],
        ),
      ),
    );
  }
}

