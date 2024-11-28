import 'package:flutter/material.dart';

void main() {
  runApp(Newpage());
}

class Newpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateNewListScreen(),
    );
  }
}

class CreateNewListScreen extends StatefulWidget {
  @override
  _CreateNewListScreenState createState() => _CreateNewListScreenState();
}

class _CreateNewListScreenState extends State<CreateNewListScreen> {
  final TextEditingController _listTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Create new list',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                String listTitle = _listTitleController.text.trim();
                if (listTitle.isNotEmpty) {
                  print('List created: $listTitle');
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a list title')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _listTitleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter list title',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}import 'package:flutter/material.dart';

void main() {
  runApp(Newpage());
}

class Newpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateNewListScreen(),
    );
  }
}

class CreateNewListScreen extends StatefulWidget {
  @override
  _CreateNewListScreenState createState() => _CreateNewListScreenState();
}

class _CreateNewListScreenState extends State<CreateNewListScreen> {
  final TextEditingController _listTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Create new list',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                String listTitle = _listTitleController.text.trim();
                if (listTitle.isNotEmpty) {
                  print('List created: $listTitle');
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a list title')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _listTitleController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter list title',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
