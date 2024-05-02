import 'package:flutter/material.dart';
import 'package:game_perfomans/src/app/app.dart';
import 'package:game_perfomans/src/modules/home_view2.dart';

void main() {
  runApp(const MyApp());
}

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Game Performance Analytics',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GameInputScreen(),
//     );
//   }
// }

// class GameInputScreen extends StatefulWidget {
//   @override
//   _GameInputScreenState createState() => _GameInputScreenState();
// }

// class _GameInputScreenState extends State<GameInputScreen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController gameController = TextEditingController();
//   TextEditingController betsController = TextEditingController();
//   TextEditingController winsController = TextEditingController();
//   TextEditingController lossesController = TextEditingController();
//   TextEditingController playTimeController = TextEditingController();

//   List<GameData> gameDataList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter Game Data'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: gameController,
//                 decoration: InputDecoration(labelText: 'Game'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter a game';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: betsController,
//                 decoration: InputDecoration(labelText: 'Total Bets'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter total bets';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: winsController,
//                 decoration: InputDecoration(labelText: 'Total Wins'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter total wins';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: lossesController,
//                 decoration: InputDecoration(labelText: 'Total Losses'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter total losses';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: playTimeController,
//                 decoration: InputDecoration(labelText: 'Play Time (minutes)'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter play time';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     setState(() {
//                       gameDataList.add(GameData(
//                         gameController.text,
//                         int.parse(betsController.text),
//                         int.parse(winsController.text),
//                         int.parse(lossesController.text),
//                         int.parse(playTimeController.text),
//                       ));
//                       // Clear text fields after submitting
//                       gameController.clear();
//                       betsController.clear();
//                       winsController.clear();
//                       lossesController.clear();
//                       playTimeController.clear();
//                     });
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//               SizedBox(height: 20),
//               Expanded(
//                 child: Container(
//                   height: 300,
//                   child: charts.BarChart(
//                     _createChartData(),
//                     animate: true,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<charts.Series<GameData, String>> _createChartData() {
//     return [
//       charts.Series<GameData, String>(
//         id: 'Game Performance',
//         domainFn: (GameData data, _) => data.game,
//         measureFn: (GameData data, _) => data.wins,
//         data: gameDataList,
//       ),
//     ];
//   }
// }
