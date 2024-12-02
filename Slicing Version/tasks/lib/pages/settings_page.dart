import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _notificationSetting = '15 Minutes Before';
  String _themeSetting = 'System Default';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                
                Navigator.pop(context);
              },
            ),
            const Text('Manage & Settings'),
          ],
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: const Text('Manage your Google Account'),
              leading: const Icon(Icons.account_circle),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 2),
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notification',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  RadioListTile<String>(
                    title: const Text('None'),
                    value: 'None',
                    groupValue: _notificationSetting,
                    onChanged: (value) {
                      setState(() {
                        _notificationSetting = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('15 Minutes Before'),
                    value: '15 Minutes Before',
                    groupValue: _notificationSetting,
                    onChanged: (value) {
                      setState(() {
                        _notificationSetting = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('30 Minutes Before'),
                    value: '30 Minutes Before',
                    groupValue: _notificationSetting,
                    onChanged: (value) {
                      setState(() {
                        _notificationSetting = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('1 Hour Before'),
                    value: '1 Hour Before',
                    groupValue: _notificationSetting,
                    onChanged: (value) {
                      setState(() {
                        _notificationSetting = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose Theme',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  RadioListTile<String>(
                    title: const Text('Light'),
                    value: 'Light',
                    groupValue: _themeSetting,
                    onChanged: (value) {
                      setState(() {
                        _themeSetting = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Dark'),
                    value: 'Dark',
                    groupValue: _themeSetting,
                    onChanged: (value) {
                      setState(() {
                        _themeSetting = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('System Default'),
                    value: 'System Default',
                    groupValue: _themeSetting,
                    onChanged: (value) {
                      setState(() {
                        _themeSetting = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const ListTile(
            title: Text('Help & Feedback'),
            leading: Icon(Icons.help_outline),
          ),
          const Divider(),
          const Center(
            child: Text(
              'Privacy Policy | Terms of Service | Open-source licenses',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
