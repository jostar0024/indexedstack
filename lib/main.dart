import 'package:flutter/material.dart';
import 'package:indexstack/counter.dart';
import 'package:indexstack/dammy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  var _selectedIndex = 0;
  final List<Widget> _widgetList = <Widget>[
    const Counter(),
    const Dammy(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.abc), label: 'count'),
          NavigationDestination(icon: Icon(Icons.ac_unit), label: 'dammy'),
        ],
        onDestinationSelected: (index) => setState(
          () {
            _selectedIndex = index;
          },
        ),
        selectedIndex: _selectedIndex,
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetList,
        ),
      ),
    );
  }
}
