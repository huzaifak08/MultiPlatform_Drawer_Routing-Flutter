import 'package:drawer_routing/drawer_class.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List with 50 Contacts:
  final List<String> items =
      List<String>.generate(50, (index) => "Contact ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Routing'),
      ),
      drawer: const MyDrawer(),
      body: Container(
          child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            onDismissed: (direction) {
              items.removeAt(index);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Item Deleted')));
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text('${items[index]}'),
              subtitle: Text('Swipe to Delete'),
              leading: CircleAvatar(child: Text('C')),
              trailing: Icon(Icons.delete),
            ),
          );
        },
      )),
    );
  }
}
