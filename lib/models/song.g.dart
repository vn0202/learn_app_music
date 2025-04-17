// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongAdapter extends TypeAdapter<Song> {
  @override
  final int typeId = 0;

  @override
  Song read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Song(
      name: fields[1] as String,
      imagePath: fields[2] as String,
      singer: fields[3] as String,
      id: fields[0] as String,
      tranlations: (fields[5] as Map?)?.cast<String, Translation>(),
      availableTranslations: (fields[4] as List?)?.cast<dynamic>(),
      lyrics: (fields[6] as List?)?.cast<Lyric>(),
    );
  }

  @override
  void write(BinaryWriter writer, Song obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.singer)
      ..writeByte(4)
      ..write(obj.availableTranslations)
      ..writeByte(5)
      ..write(obj.tranlations)
      ..writeByte(6)
      ..write(obj.lyrics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
