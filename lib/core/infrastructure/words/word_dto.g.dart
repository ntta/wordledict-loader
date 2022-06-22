// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordDto _$$_WordDtoFromJson(Map<String, dynamic> json) => _$_WordDto(
      id: json['id'] as String,
      origin: json['origin'] as String,
      meanings: (json['meanings'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$$_WordDtoToJson(_$_WordDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'meanings': instance.meanings,
    };
