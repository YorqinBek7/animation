import 'package:flutter/material.dart';

const tabelName = "notes_table";

class NotesTablesFields {
  static const id = "id";
  static const title = "title";
  static const subtitle = "subtitle";
  static const date = "date";
}

class NotesTable {
  final int? id;
  final String title;
  final String subtitle;
  final String date;
  NotesTable(
      {required this.date,
      this.id,
      required this.subtitle,
      required this.title});
  NotesTable copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? date,
  }) =>
      NotesTable(
        date: date ?? this.date,
        id: id ?? this.id,
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );
  static NotesTable fromJson(Map<String, Object?> json) {
    return NotesTable(
        id: json[NotesTablesFields.id] as int,
        date: json[NotesTablesFields.date] as String,
        subtitle: json[NotesTablesFields.subtitle] as String,
        title: json[NotesTablesFields.title] as String);
  }

  Map<String, Object?> toJson() => {
        NotesTablesFields.date: date,
        NotesTablesFields.id: id,
        NotesTablesFields.subtitle: subtitle,
        NotesTablesFields.title: title
      };
}
