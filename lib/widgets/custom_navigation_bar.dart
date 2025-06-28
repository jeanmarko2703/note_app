import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<NavigationProvider>().currentIndex;

    return SizedBox(
      height: 100,
      width: double.infinity,
      child: BottomNavigationBar(
        onTap: (value) {
          context.read<NavigationProvider>().updateCurrentIndex(value);

          if (value == index) return;

          if (value == 0) {
            Navigator.pushNamed(context, 'homeScreen');
          } else if (value == 1) {
            Navigator.pushNamed(context, 'CreateNoteScreen');
          }
        },
        currentIndex: index,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 236, 130, 59),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_outlined),
            label: "New Note",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
        ],
      ),
    );
  }
}
