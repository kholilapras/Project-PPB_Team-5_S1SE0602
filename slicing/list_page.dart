import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Google Tasks'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tugas Saya'),
              Tab(text: 'PPB'),
              Tab(text: '+ New list'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTaskList(context),
            const Center(child: Text('PPB')),
            const Center(child: Text('New list')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add task logic
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildTaskList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildTaskCard(
          title: 'Quiz 11 PMPL',
          description: 'Materi : SQA & Quality Control',
          date: 'Friday, Jan 10, 2025 | 19.30',
        ),
        _buildTaskCard(
          title: 'Presentasi MPB',
          description: 'Lorem ipsum dolor sit amet consectetur adipiscing elit',
          date: 'Friday, Jan 10, 2025 | 19.30',
        ),
        _buildTaskCard(
          title: 'Laporan Akhir',
          description: 'Materi : SQA & Quality Control',
          date: 'Friday, Jan 17, 2025 | 19.30',
        ),
        const Divider(),
        const Text(
          'Completed (1)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        _buildTaskCard(
          title: 'Laporan Akhir',
          description: 'Materi : SQA & Quality Control',
          date: 'Monday, Oct 28, 2025 | 19.30',
          completed: true,
        ),
      ],
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String description,
    required String date,
    bool completed = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.blue : Colors.grey,
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: const Icon(Icons.star_border),
      ),
    );
  }
}
