import 'package:flutter/material.dart';

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
      home: const Dismissal(),
    );
  }
}

class Dismissal extends StatefulWidget {
  const Dismissal({Key? key}) : super(key: key);

  @override
  State<Dismissal> createState() => _DismissalState();
}

class _DismissalState extends State<Dismissal> {
  final items = List<String>.generate(20, (i) => 'items ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('dismissal'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
                 
            },
            background: Container(color: Colors.red,),
            child: const Text('hi'),
          );
        },
      ),
    );
  }
}
