import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var workoutList;
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = WorkoutList();
        break;
      case 1:
        // page = Workout();
        break;
      case 2:
        // page = WorkoutCreate()
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Workout List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_gymnastics),
              label: 'Current Workout',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_score),
              label: 'Past Workouts',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      );
    });
  }
}

class WorkoutList extends StatefulWidget {
  Widget build(BuildContext context) {
    var workoutList = context.watch<MyAppState>().workoutList;

    return ListView(
      children: [
        Title(
            color: Theme.of(context).colorScheme.onPrimary,
            child: Text("Workouts:")),
        for (var workout in workoutList) Text(workout),
      ],
    );
  }
}
