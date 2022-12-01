import 'package:cloud_firestore/cloud_firestore.dart';

class TimestampConverter {
  static Timestamp? timestampFromJson(Timestamp? timestamp) => timestamp;
  static Timestamp? timestampToJson(Timestamp? json) => json;
}
