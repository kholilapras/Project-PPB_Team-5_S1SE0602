import 'package:flutter/material.dart';
import 'package:tasks/pages/starred_page.dart';
import 'package:tasks/pages/new_list_page.dart';
import 'package:tasks/pages/create_new_tasks_page.dart';
import 'package:tasks/pages/settings_page.dart';
import 'package:tasks/data/data_test.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> tasks = [];
  late TabController _tabController;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 5) {
        Future.microtask(() {
          _tabController.index = 0;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewListPage()),
          );
        });
      }
    });

    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final fetchedTasks = await _dbHelper.getTasks();
    setState(() {
      tasks = fetchedTasks;
    });
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !(tasks[index]['completed'] as bool);

      _dbHelper.updateTask(tasks[index]['id'], {
        'completed': tasks[index]['completed'] ? 1 : 0,
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.star)),
              Tab(text: 'Tugas Saya'),
              Tab(text: 'Tugas Saya1'),
              Tab(text: 'Tugas Saya2'),
              Tab(text: 'PPB'),
              Tab(text: '+ New list'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const StarredPage(),
          _buildTaskList(),
          const Center(child: Text('Tugas Saya1')),
          const Center(child: Text('Tugas Saya2')),
          const Center(child: Text('PPB')),
          Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateNewTasks(),
            ),
          );
          if (result == true) {
            _fetchTasks();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskList() {
    if (tasks.isEmpty) {
      return const Center(
        child: Text('No tasks available.'),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...tasks.map((task) {
          int index = tasks.indexOf(task);
          return _buildTaskCard(
            title: task['task_name'],
            description: task['description_task'],
            date: task['date'],
            time: task['time'], // Menambahkan field waktu
            completed: task['completed'] == 1,
            onToggle: () => toggleTaskCompletion(index),
          );
        }).toList(),
        const Divider(),
        const Text('Completed Tasks'),
        ...tasks
            .where((task) => task['completed'] == 1)
            .map((task) => ListTile(
                  title: Text(task['task_name']),
                  subtitle: Text(task['description_task']),
                ))
            .toList(),
      ],
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String description,
    required String date,
    required String time, // Menambahkan parameter waktu
    required bool completed,
    required VoidCallback onToggle,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: GestureDetector(
          onTap: onToggle,
          child: Icon(
            completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: completed ? Colors.blue : Colors.grey,
          ),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(date),
                const SizedBox(width: 8),
                Text(time), // Menampilkan waktu di sebelah tanggal
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.star_border),
      ),
    );
  }
}
