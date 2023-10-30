import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:knowledge_kube/pages/response_model.dart';
import 'send_Data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final TextEditingController promptController;
  String responseTxt = '';
  late ResponseModel responseModel;
  late sendData sdata;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 128, 122, 122),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PromptBldr(
              responseTxt: responseTxt,
              question: promptController.text,
            ),
            TextFormFieldBldr(
                promptController: promptController, btnFun: completionFun),
          ],
        ),
      ),
    );
  }

  completionFun() async {
    setState(() => responseTxt = 'Loading...');

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['token']}'
      },
      body: jsonEncode(
        {
          "model": "text-davinci-003",
          "prompt": promptController.text,
          "max_tokens": 250,
          "temperature": 0,
          "top_p": 1,
        },
      ),
    );

    setState(() {
      responseModel = ResponseModel.fromJson(response.body);
      responseTxt = responseModel.choices[0]['text'];
      debugPrint(responseTxt);
    });
  }
}

class TextFormFieldBldr extends StatelessWidget {
  const TextFormFieldBldr({
    Key? key,
    required this.promptController,
    required this.btnFun,
  }) : super(key: key);

  final TextEditingController promptController;
  final Function btnFun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: promptController,
        decoration: const InputDecoration(
          hintText: 'Enter your question',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        onFieldSubmitted: (value) {
          btnFun();
        },
      ),
    );
  }
}

class PromptBldr extends StatelessWidget {
  const PromptBldr({
    Key? key,
    required this.responseTxt,
    required this.question,
  }) : super(key: key);

  final String responseTxt;
  final String question;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 177, 21, 169),
            ),
            child: Column(
              children: [
                //if there is a null value in question ask user to enter a question
                if (question == '')
                  Center(
                    child: Text(
                      'Enter a question',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                //else
                if (question != '')
                  Text('Q. $question',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                Text(
                  'A. $responseTxt',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
