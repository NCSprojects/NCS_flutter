import 'package:json_annotation/json_annotation.dart';

part 'contents_model.g.dart';

@JsonSerializable()
class Contents {
  final int id;
  @JsonKey(name: 'code_grp')
  final String? codeGrp;
  final String? title;
  final String? content;
  final String? photo;
  final String? mainText;
  final String? subText;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final bool chkDup;
  final int duration;
  final DateTime? stdDate;
  final DateTime? endDate;
  final int totSeats;
  final List<Schedule> schedules;

  Contents({
    required this.id,
    required this.codeGrp,
    required this.title,
    required this.content,
    required this.photo,
    required this.mainText,
    required this.subText,
    required this.createdAt,
    required this.chkDup,
    required this.duration,
    required this.stdDate,
    required this.endDate,
    required this.totSeats,
    required this.schedules,
  });

  factory Contents.fromJson(Map<String, dynamic> json) => _$ContentsFromJson(json);
  Map<String, dynamic> toJson() => _$ContentsToJson(this);
}

@JsonSerializable()
class Schedule {
  final int id;
  final int contentId;
  final DateTime startTime;
  final DateTime endTime;
  final int seatCount;

  Schedule({
    required this.id,
    required this.contentId,
    required this.startTime,
    required this.endTime,
    required this.seatCount,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}