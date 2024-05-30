// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectStatus {
  final String title;
  final String status;
  final DateTime timestamp;
  final bool isComplete;

  ProjectStatus({
    required this.title,
    required this.status,
    required this.timestamp,
    this.isComplete = false,
  });

  ProjectStatus copyWith({
    String? title,
    String? status,
    DateTime? timestamp,
    bool? isComplete,
  }) {
    return ProjectStatus(
      title: title ?? this.title,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'status': status,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'isComplete': isComplete,
    };
  }

  factory ProjectStatus.fromMap(Map<String, dynamic> map) {
    return ProjectStatus(
      title: map['title'] as String,
      status: map['status'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
      isComplete: map['isComplete'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectStatus.fromJson(String source) => ProjectStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjectStatus(title: $title, status: $status, timestamp: $timestamp, isComplete: $isComplete)';
  }

  @override
  bool operator ==(covariant ProjectStatus other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.status == status &&
      other.timestamp == timestamp &&
      other.isComplete == isComplete;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      status.hashCode ^
      timestamp.hashCode ^
      isComplete.hashCode;
  }
}
