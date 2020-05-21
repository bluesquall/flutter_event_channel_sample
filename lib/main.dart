import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Event Channel StreamBuilder Sample';
  static const channel = const EventChannel('com.yourcompany.eventchannelsample/stream');

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: channel.receiveBroadcastStream(),
        builder: (context, snapshot) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Event and Method Channel Sample'),
              subtitle: const Text('An example application showing off the communications between Flutter and native Android.'),
              trailing: Text(snapshot.hasData ? '${snapshot.data}' : ''),
            )
          );
        },
      )
    ),
  );
}
