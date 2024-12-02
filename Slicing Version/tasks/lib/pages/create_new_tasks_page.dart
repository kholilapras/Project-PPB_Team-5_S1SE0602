import 'package:flutter/material.dart';
import 'package:tasks/data/data_test.dart';

class CreateNewTasks extends StatefulWidget {
  const CreateNewTasks({super.key});

  @override
  State<CreateNewTasks> createState() => _CreateNewTasksState();
}

class _CreateNewTasksState extends State<CreateNewTasks> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  bool isImportant = false; 
  final DatabaseHelper _dbHelper = DatabaseHelper(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Create New Task'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () async {
              
              if (titleController.text.isEmpty ||
                  detailsController.text.isEmpty ||
                  dateController.text.isEmpty ||
                  timeController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please complete all fields'),
                  ),
                );
                return;
              }

              
              final newTask = {
                'list_name': 'Default', 
                'task_name': titleController.text,
                'description_task': detailsController.text,
                'date': dateController.text,
                'time': timeController.text,
                'starred': isImportant ? 1 : 0,
              };
              await _dbHelper.insertTask(newTask);

              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task saved successfully!')),
              );
              Navigator.pop(context, true); 
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              children: [
                const Icon(Icons.title, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Add title',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.article, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: detailsController,
                    decoration: const InputDecoration(
                      hintText: 'Add details',
                      border: UnderlineInputBorder(),
                    ),
                    minLines: 1,
                    maxLines: null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      hintText: 'Select date',
                      border: UnderlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          dateController.text =
                              '${picked.toLocal()}'.split(' ')[0];
                        });
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            
            Row(
              children: [
                const Icon(Icons.access_time, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: timeController,
                    decoration: const InputDecoration(
                      hintText: 'Select time',
                      border: UnderlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          timeController.text = picked.format(context);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isImportant ? Icons.star : Icons.star_border,
                    color: isImportant ? const Color(0xFF2684FC) : Colors.grey,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      isImportant = !isImportant;
                    });
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  'Mark as important',
                  style: TextStyle(
                    fontSize: 16,
                    color: isImportant ? const Color(0xFF2684FC) : Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
