// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contents_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contents _$ContentsFromJson(Map<String, dynamic> json) => Contents(
      id: (json['id'] as num).toInt(),
      codeGrp: json['code_grp'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      photo: json['photo'] as String?,
      mainText: json['mainText'] as String?,
      subText: json['subText'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      chkDup: json['chkDup'] as bool,
      duration: (json['duration'] as num).toInt(),
      stdDate: json['stdDate'] == null
          ? null
          : DateTime.parse(json['stdDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      totSeats: (json['totSeats'] as num).toInt(),
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentsToJson(Contents instance) => <String, dynamic>{
      'id': instance.id,
      'code_grp': instance.codeGrp,
      'title': instance.title,
      'content': instance.content,
      'photo': instance.photo,
      'mainText': instance.mainText,
      'subText': instance.subText,
      'created_at': instance.createdAt?.toIso8601String(),
      'chkDup': instance.chkDup,
      'duration': instance.duration,
      'stdDate': instance.stdDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'totSeats': instance.totSeats,
      'schedules': instance.schedules,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      id: (json['id'] as num).toInt(),
      contentId: (json['contentId'] as num).toInt(),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      seatCount: (json['seatCount'] as num).toInt(),
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'contentId': instance.contentId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'seatCount': instance.seatCount,
    };
