import 'package:flutter/material.dart';

void main() {
  runApp(const KMailApp());
}

class KMailApp extends StatelessWidget {
  const KMailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K Mail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const InboxPage(),
    );
  }
}

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("K Mail"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ComposeMailPage()),
          );
        },
        child: const Icon(Icons.edit),
      ),
      body: ListView(
        children: const [
          MailTile(
            sender: "Google",
            subject: "Security Alert",
            message: "New sign-in from Chrome device",
            time: "10:30 AM",
          ),
          MailTile(
            sender: "Kicha AI",
            subject: "Welcome to K Mail",
            message: "Your AI-powered mail app is ready!",
            time: "09:10 AM",
          ),
          MailTile(
            sender: "Flutter Team",
            subject: "Flutter 3.38 Released",
            message: "Check out what's new in Flutter",
            time: "Yesterday",
          ),
        ],
      ),
    );
  }
}

class MailTile extends StatelessWidget {
  final String sender;
  final String subject;
  final String message;
  final String time;

  const MailTile({
    super.key,
    required this.sender,
    required this.subject,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(sender[0]),
      ),
      title: Text(
        sender,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subject, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: Text(time),
    );
  }
}

class ComposeMailPage extends StatelessWidget {
  const ComposeMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compose Mail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "To"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Subject"),
            ),
            const Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  labelText: "Message",
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text("Send"),
            )
          ],
        ),
      ),
    );
  }
}
