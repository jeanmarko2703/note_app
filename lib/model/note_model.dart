class Note {
  final String id;
  final String date;
  final String day;
  final String text;
  final bool? isFavorite;

  Note({
    required this.id,
    required this.date,
    required this.day,
    required this.text,
    this.isFavorite = false,
  });

  factory Note.fromMap(String id, Map<String, dynamic> data) {
    return Note(
      id: id,
      date: data['date'] ?? '',
      day: data['day'] ?? '',
      text: data['text'] ?? '',
      isFavorite: data['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'day': day,
      'text': text,
      'isFavorite': isFavorite ?? false,
    };
  }
}
