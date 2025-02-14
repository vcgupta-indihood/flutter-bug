import 'package:flutter/material.dart';
import 'package:routeaware/platform_impl/platform_impl.dart';
import 'package:routeaware/render_topic.dart';

import 'main.dart';

class RouteTestingPage extends StatefulWidget {
  const RouteTestingPage({Key? key}) : super(key: key);

  static String ROUTE = '/route_testing_page';

  @override
  State<RouteTestingPage> createState() => _RouteTestingPageState();
}

class _RouteTestingPageState extends State<RouteTestingPage> with RouteAware {
  var _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    print("RouteTestingPage build");
    // Return a Container, having a row behaving like a panel. First Cell
    // containing list of items numbered from 'List 1' to 'List 5'. Second
    // should contain a Text widget with text 'Details'. which changes
    // content on pressing on ListItem from first Cell
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Route testing page"),
        ),
        body: Center(
            child: Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('List ${index + 1}'),
                      onTap: () {
                        this.setState(() {
                          _selectedItemIndex = index;
                        });
                        updateRoute();
                        // Update the state of the app
                      },
                    );
                  },
                )),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text('Details'),
                  Text('Selected Item: ${_selectedItemIndex + 1}'),
                  TextButton(
                      onPressed: () {
                        //Navigator push route render_topic
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(
                                    name:
                                        '/render_topic_page/${_selectedItemIndex + 1} '),
                                builder: (context) => RenderTopic(
                                    index: _selectedItemIndex + 1)));
                      },
                      child:
                          Text("Go to render topic ${_selectedItemIndex + 1}")),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Dialog"),
                                  content: Text("This is a dialog"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Close"))
                                  ],
                                ));
                      },
                      child: Text("Show dialog"))
                ],
              )),
            ],
          ),
        )));
  }

  void updateRoute() {
    PlatformImpl().pushRoute(
        RouteTestingPage.ROUTE + '/' + (_selectedItemIndex + 1).toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didPopNext() {
    print("didPopNext");
    // TODO: implement didPopNext
    super.didPopNext();
  }
}
