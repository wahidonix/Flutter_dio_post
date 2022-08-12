import 'package:flutter/material.dart';
import 'post_model.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _post;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController opisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
            ),
            TextField(
              controller: opisController,
            ),
            ElevatedButton(
                onPressed: () async {
                  final String title = titleController.text;
                  final String opis = opisController.text;

                  final String post = await createPost(title, opis);
                  setState(() {
                    _post = post;
                  });
                },
                child: Text('Post data')),
            SizedBox(
              height: 32,
            ),
            _post == null ? Container() : Text("$_post")
          ],
        ),
      ),
    );
  }
}

Future<String> createPost(String title, String opis) async {
  final uri = Uri.https('vahanapi.herokuapp.com', '/posts');
  final response = await Dio().post('https://vahanapi.herokuapp.com/posts',
      data: {"title": title, "opis": opis});

  if (response.statusCode == 200) {
    return (response.data.toString());
  } else {
    return ("ne radi");
  }
}
