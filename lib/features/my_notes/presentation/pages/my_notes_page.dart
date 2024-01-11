import 'package:flutter/material.dart';

class MyNotesPage extends StatelessWidget {
  const MyNotesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Мои записи'),
        ),
      );
}
