import 'dart:convert';
import 'package:flutter/material.dart';


class Note {
  int id;
  String title;
  String content;
  DateTime date_created;
  DateTime date_last_edited;
  Color note_color;
  DateTime reminder_time;


  Note(this.id, this.title, this.content, this.date_created, this.date_last_edited,this.note_color, this.reminder_time);


  Map<String, dynamic> toMap(bool forUpdate) {
    var data = {
      'title': utf8.encode(title),
      'content': utf8.encode( content ),
      'date_created': epochFromDate( date_created ),
      'date_last_edited': epochFromDate( date_last_edited ),
      'note_color': note_color.value,
      'reminder_time': epochFromDate( reminder_time ),
    };
    if(forUpdate){
      data["id"] = this.id;
    }
    return data;
  }

  // Converting the date time object into int representing seconds passed after midnight 1st Jan, 1970 UTC
  int epochFromDate(DateTime dt) {
      return dt.millisecondsSinceEpoch ~/ 1000 ;
  }


  // overriding toString() of the note class to print a better debug description of this custom class
  @override toString() {
    return {
      'id': id,
      'title': title,
      'content': content ,
      'date_created': epochFromDate( date_created ),
      'date_last_edited': epochFromDate( date_last_edited ),
      'note_color': note_color.toString(),
      'reminder_time': epochFromDate( reminder_time ),
    }.toString();
  }

}