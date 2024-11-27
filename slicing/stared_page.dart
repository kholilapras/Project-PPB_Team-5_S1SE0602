import 'package:flutter/material.dart';
import 'database_helper.dart';

class StarredPage extends StatefulWidget {
  const StarredPage({Key? key}) : super(key: key);

  @override
  _StarredPageState createState() => _StarredPageState();
}

class _StarredPageState extends State<StarredPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<String> lists = [];

  @override
  void initState() {
    super.initState();
    _loadLists();
  }

  Future<void> _loadLists() async {
    final data = await _dbHelper.getLists();
    setState(() {
      lists = data;
    });
  }

  Future<void> _addList(String name) async {
    await _dbHelper.addList(name);
    _loadLists();
  }

  void _showAddListDialog() {
    String newListName = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New List'),
          content: TextField(
            decoration: const InputDecoration(hintText: 'Enter list name'),
            onChanged: (value) {
              newListName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newListName.isNotEmpty) {
                  _addList(newListName);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Google Tasks',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.star, color: Colors.white),
                  label: const Text('Tugas Saya', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ...lists.map((listName) => TextButton(
                      onPressed: () {},
                      child: Text(
                        listName,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
                const SizedBox(width: 10),
                TextButton.icon(
                  onPressed: _showAddListDialog,
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('New list', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star_border, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'No starred tasks',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Mark important tasks with a star so you can easily find them here',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
