import 'package:drawer_routing/routes.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Routing'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Huzaifa Khan'),
              accountEmail: Text('hk7928042@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/dp.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  child: ClipOval(
                    child: CircleAvatar(
                      backgroundImage:

                          // In the IOS 1st image will be shown otherwise 2nd image will be shown:
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? AssetImage('assets/dp.jpg') // 1st Image
                              : AssetImage('assets/dp.jpg'), // 2nd Image
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text('Home'),
              subtitle: Text('Buy Products'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                // Close the drawer and then move to page01
                Navigator.of(context).pop();

                Navigator.of(context).pushNamed(page01Route);
              },
            ),
            ListTile(
              title: Text('Home'),
              subtitle: Text('Buy Products'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                // Close the drawer and then move to page01
                Navigator.of(context).pop();

                Navigator.of(context).pushNamed(page01Route);
              },
            ),
            ListTile(
              title: Text('Home'),
              subtitle: Text('Buy Products'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                // Close the drawer and then move to page01
                Navigator.of(context).pop();

                Navigator.of(context).pushNamed(page01Route);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              leading: Icon(Icons.close),
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const Center(
              child: Text(
                'Powered by CapregSoft',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: const Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
