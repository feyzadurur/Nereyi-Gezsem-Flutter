import 'package:flutter/material.dart';
import 'package:dart_openai/dart_openai.dart';

void main() {
  //OpenAI.apiKey gelecek
  
  // Replace with your actual API key
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OpenAI Sohbet',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _soruController = TextEditingController();
  List<String> _sohbetMesajlari = [];

  void _soruGonder(String soru) async {
    final openai = OpenAI.instance;

    // Fix for parsing error: Include "JSON" in a system message
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "Respond to the prompt in JSON format",
        ),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    // Define the prompt here
    String prompt =
        "Bilgili ve kapsamlı bir şekilde yanıtlayın, açıklamaları normal cümleler halinde yap ve response tek bir paragraf olsun:\n";

    final kullaniciMesaji = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt + soru),
      ],
      role: OpenAIChatMessageRole.user,
    );

    final requestMessages = [systemMessage, kullaniciMesaji];

    try {
      final cevapMesaji = await openai.chat.create(
        model:
            "gpt-3.5-turbo-1106", // Verify model availability in your account
        responseFormat: {"type": "json_object"}, // Expect JSON response
        seed: 6,
        messages: requestMessages,
        temperature: 0.2,
        maxTokens: 500,
      );

      setState(() {
        _sohbetMesajlari.add("Kullanıcı: $soru");
        final responseContent = cevapMesaji.choices.first.message.content;
        if (responseContent != null) {
          final responseText =
              responseContent.firstWhere((item) => item.type == "text").text;
          _sohbetMesajlari.add("AI: $responseText");
        } else {
          _sohbetMesajlari.add("AI: Bir hata oluştu.");
        }
      });
    } catch (error) {
      print(error); // Log the error for debugging
      setState(() {
        _sohbetMesajlari
            .add("AI: Bir hata oluştu."); // Inform user about the error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seyahat AI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _sohbetMesajlari.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_sohbetMesajlari[index]),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _soruController,
                    decoration: InputDecoration(hintText: 'Sorunuzu girin...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String soru = _soruController.text.trim();
                    if (soru.isNotEmpty) {
                      _soruGonder(soru);
                      _soruController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
