import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const title = 'Flutter ColorFilter Demo';
  var mode = BlendMode.dst;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.red, mode),
          child: Scaffold(
            appBar: AppBar(title: Text(title)),
            body: Center(
              child: ListView(
                children: (List.from(BlendMode.values)..sort((a, b) => a.toString().compareTo(b.toString())))
                    .map(
                      (m) => ListTile(
                        title: Text(m.toString()),
                        selected: m == mode,
                        onTap: () => setState(() => mode = m),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      );
}
