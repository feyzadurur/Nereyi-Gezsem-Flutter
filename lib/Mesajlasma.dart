import 'package:flutter/material.dart';

class Mesajlasma extends StatefulWidget {
  const Mesajlasma({super.key});

  @override
  State<Mesajlasma> createState() => _MesajlasmaState();
}

class _MesajlasmaState extends State<Mesajlasma> with TickerProviderStateMixin {

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sohbet"),
        backgroundColor: Colors.teal.shade400,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index)=> _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color:Colors.teal),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children:[

            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text){
                  setState(() {
                    _isComposing=text.length>0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: "Mesaj gönder",
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComposing ?() => _handleSubmitted(_textController.text):null,
              ),
            ),


          ],
        ),
      ),
    );

  }

  void _handleSubmitted(String text) {
    _textController.clear();

    setState(() {
      _isComposing=false;
    });

    ChatMessage message =ChatMessage(
      text:text,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0,message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for(ChatMessage message in _messages){
      message.animationController.dispose();
      super.dispose();
    }
  }

}


class ChatMessage extends StatelessWidget {
  final String text;

  final AnimationController animationController;


  ChatMessage({required this.text, required this.animationController});

  @override
  Widget build(BuildContext context) {

    const String _name = "Kullanıcı";

    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController,curve: Curves.easeOut),
      axisAlignment:0.0,
      child:Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.labelMedium),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

