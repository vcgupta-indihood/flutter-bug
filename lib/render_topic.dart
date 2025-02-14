import 'package:flutter/material.dart';

class RenderTopic extends StatefulWidget {
  final int index;
  const RenderTopic({Key? key, required this.index}) : super(key: key);

  @override
  State<RenderTopic> createState() => _RenderTopicState();
}

class _RenderTopicState extends State<RenderTopic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Page: ${widget.index}"),
        ),
        body:
            Center(child: Text("Displaying topic with index ${widget.index}")));
  }
}
