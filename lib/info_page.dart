import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact US'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Simple Sheet'),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => buildSheet1(),
              ),
            ),
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => buildSheet2()),
              child: Text('Full Screen Sheet'),
            ),
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  // enableDrag: false,
                  // isDismissible: false,

                  isScrollControlled: true, // Stop the OverFlow Problem

                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => buildSheet3()),
              child: Text('Scrollable Sheet'),
            )
          ],
        ),
      ),
    );
  }
}

// Simple Sheet:
Widget buildSheet1() => Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: 12),
          CircleAvatar(
            backgroundImage: AssetImage('assets/dp.jpg'),
            radius: 100,
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              'Huzaifa Khan',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen boo")
        ],
      ),
    );

// Full Screen Sheet:

Widget buildSheet2() => Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          // mainAxisSize: MainAxisSize.min, // Get the minimum space as possible in row or column
          Text(
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
// Scrollable Full Screen Sheet
Widget buildSheet3() => DraggableScrollableSheet(
      initialChildSize: 0.9, // initial size
      minChildSize: 0.5, // 50%
      maxChildSize: 0.9, // 90%

      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(16),
        child: ListView(
          controller: controller, // make custom scrollable through fingers
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/dp.jpg'),
              radius: 160,
            ),
            Text(
              'Huzaifa Khan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum(The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32. ",
              style: TextStyle(fontSize: 16),
            ),
            Text("")
          ],
        ),
      ),
    );
