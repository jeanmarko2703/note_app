import 'package:class_4/model/note_model.dart';
import 'package:class_4/providers/note_provider.dart';
import 'package:class_4/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getNotes();
    });
  }

  Future<void> getNotes() async {
    setState(() {
      _isLoading = true;
    });
    await context.read<NoteProvider>().getAllNotes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final noteProvider = context.watch<NoteProvider>();
    final notes = noteProvider.notes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
        centerTitle: false,
        actions: [Icon(Icons.person_outline), SizedBox(width: 10)],
      ),
      body:
          _isLoading == true
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                onRefresh: getNotes,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                      notes.isEmpty
                          ? Center(child: Text("Is empty :("))
                          : ListView.builder(
                            itemCount: notes.length,
                            itemBuilder: (context, index) {
                              return NoteCard(note: notes[index]);
                            },
                          ),
                ),
              ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Note note;
  @override
  Widget build(BuildContext context) {
    final noteProvider = context.read<NoteProvider>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(note.date),
              Spacer(),
              Text(note.day),
              IconButton(
                onPressed: () => noteProvider.deleteNote(note.id),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          Divider(),
          Text(
            note.text,
            textAlign: TextAlign.justify,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
