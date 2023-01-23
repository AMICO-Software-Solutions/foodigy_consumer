import 'package:flutter/material.dart';
import 'package:foodigy/utilities/const_color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 246, 246),
      appBar: AppBar(
        backgroundColor: firstColor,
        leading: BackButton(color: firstColor),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.notifications, size: 45),
              title: Text('No Notifications'),
              subtitle: Text('You will recieve notifications here'),
            ),
          ],
        ),
      ),
    );
    // return Card(
    //   margin: const EdgeInsets.only(top: 70),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: const <Widget>[
    //       ListTile(
    //         leading: Icon(Icons.notifications, size: 45),
    //         title: Text('Sonu Nigam'),
    //         subtitle: Text('Best of Sonu Nigam Song'),
    //       ),
    //     ],
    //   ),
    // );
  }
}
