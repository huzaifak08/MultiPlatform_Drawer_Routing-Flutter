import 'package:flutter/material.dart';

import 'routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Huzaifa Khan'),
            accountEmail: const Text('hk7928042@gmail.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/dp.jpg'),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                child: ClipOval(
                  child: CircleAvatar(
                    backgroundImage:

                        // In the IOS 1st image will be shown otherwise 2nd image will be shown:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? const AssetImage('assets/dp.jpg') // 1st Image
                            : const AssetImage('assets/dp.jpg'), // 2nd Image
                  ),
                ),
              )
            ],
          ),
          // Make image Full Screen
          ListTile(
            leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/dp.jpg')),
            title: const Text('Tap to Preview'),
            subtitle: const Text('Gesture detector'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return DetailScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Home'),
            subtitle: const Text('Buy Products'),
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.arrow_upward),
            onTap: () {
              // Close the drawer and then move to page01
              Navigator.of(context).pop();

              Navigator.of(context).pushNamed(page01Route);
            },
          ),
          ListTile(
            title: const Text('Home'),
            subtitle: const Text('Buy Products'),
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.arrow_upward),
            onTap: () {
              // Close the drawer and then move to page01
              Navigator.of(context).pop();

              Navigator.of(context).pushNamed(page01Route);
            },
          ),
          ListTile(
            title: const Text('Home'),
            subtitle: const Text('Buy Products'),
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.arrow_upward),
            onTap: () {
              // Close the drawer and then move to page01
              Navigator.of(context).pop();

              Navigator.of(context).pushNamed(page01Route);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Close'),
            leading: const Icon(Icons.close),
            trailing: const Icon(Icons.close),
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
    );
  }
}

// To make image full Screen
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset('assets/dp.jpg'),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
