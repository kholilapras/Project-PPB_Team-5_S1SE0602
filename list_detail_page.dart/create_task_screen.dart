import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  bool _isFavorite = false; // Untuk tanda prioritas

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850], 
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back, color: Colors.white),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('Create New Task', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description, color: Colors.white),
                      hintText: 'Enter title',
                      hintStyle: TextStyle(color: Colors.white60),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.star : Icons.star_border,
                    color: _isFavorite ? Colors.yellow : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite; // Toggle favorite status
                    });
                  },
                ),
              ],
            ),
            Divider(color: Colors.white54),
            TextField(
              controller: _detailsController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.warning, color: Colors.white),
                hintText: 'Add details',
                hintStyle: TextStyle(color: Colors.white60),
                border: InputBorder.none,
              ),
            ),
            Divider(color: Colors.white54),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.white),
              title: Text(
                _selectedDate == null
                    ? 'Add date'
                    : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                style: TextStyle(color: Colors.white),
              ),
              onTap: _pickDate,
            ),
            Divider(color: Colors.white54),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.white),
              title: Text(
                _selectedTime == null
                    ? 'Add time'
                    : _selectedTime!.format(context),
                style: TextStyle(color: Colors.white),
              ),
              onTap: _pickTime,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Save logic can be added here
                  print("Task Saved");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
