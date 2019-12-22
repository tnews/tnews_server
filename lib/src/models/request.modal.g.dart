// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.modal.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class SearchRequest extends _SearchRequest {
  SearchRequest({this.offset = 0, this.limit = 10});

  @override
  int offset;

  @override
  int limit;

  SearchRequest copyWith({int offset, int limit}) {
    return SearchRequest(
        offset: offset ?? this.offset, limit: limit ?? this.limit);
  }

  bool operator ==(other) {
    return other is _SearchRequest &&
        other.offset == offset &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return hashObjects([offset, limit]);
  }

  @override
  String toString() {
    return "SearchRequest(offset=$offset, limit=$limit)";
  }

  Map<String, dynamic> toJson() {
    return SearchRequestSerializer.toMap(this);
  }
}

@generatedSerializable
class CategoryRequest extends _CategoryRequest {
  CategoryRequest({this.offset = 0, this.limit = 10, this.name = ''});

  @override
  int offset;

  @override
  int limit;

  @override
  String name;

  CategoryRequest copyWith({int offset, int limit, String name}) {
    return CategoryRequest(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        name: name ?? this.name);
  }

  bool operator ==(other) {
    return other is _CategoryRequest &&
        other.offset == offset &&
        other.limit == limit &&
        other.name == name;
  }

  @override
  int get hashCode {
    return hashObjects([offset, limit, name]);
  }

  @override
  String toString() {
    return "CategoryRequest(offset=$offset, limit=$limit, name=$name)";
  }

  Map<String, dynamic> toJson() {
    return CategoryRequestSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const SearchRequestSerializer searchRequestSerializer =
    SearchRequestSerializer();

class SearchRequestEncoder extends Converter<SearchRequest, Map> {
  const SearchRequestEncoder();

  @override
  Map convert(SearchRequest model) => SearchRequestSerializer.toMap(model);
}

class SearchRequestDecoder extends Converter<Map, SearchRequest> {
  const SearchRequestDecoder();

  @override
  SearchRequest convert(Map map) => SearchRequestSerializer.fromMap(map);
}

class SearchRequestSerializer extends Codec<SearchRequest, Map> {
  const SearchRequestSerializer();

  @override
  get encoder => const SearchRequestEncoder();
  @override
  get decoder => const SearchRequestDecoder();
  static SearchRequest fromMap(Map map) {
    return SearchRequest(
        offset: map['offset'] as int ?? 0, limit: map['limit'] as int ?? 10);
  }

  static Map<String, dynamic> toMap(_SearchRequest model) {
    if (model == null) {
      return null;
    }
    return {'offset': model.offset, 'limit': model.limit};
  }
}

abstract class SearchRequestFields {
  static const List<String> allFields = <String>[offset, limit];

  static const String offset = 'offset';

  static const String limit = 'limit';
}

const CategoryRequestSerializer categoryRequestSerializer =
    CategoryRequestSerializer();

class CategoryRequestEncoder extends Converter<CategoryRequest, Map> {
  const CategoryRequestEncoder();

  @override
  Map convert(CategoryRequest model) => CategoryRequestSerializer.toMap(model);
}

class CategoryRequestDecoder extends Converter<Map, CategoryRequest> {
  const CategoryRequestDecoder();

  @override
  CategoryRequest convert(Map map) => CategoryRequestSerializer.fromMap(map);
}

class CategoryRequestSerializer extends Codec<CategoryRequest, Map> {
  const CategoryRequestSerializer();

  @override
  get encoder => const CategoryRequestEncoder();
  @override
  get decoder => const CategoryRequestDecoder();
  static CategoryRequest fromMap(Map map) {
    return CategoryRequest(
        offset: map['offset'] as int ?? 0,
        limit: map['limit'] as int ?? 10,
        name: map['name'] as String ?? '');
  }

  static Map<String, dynamic> toMap(_CategoryRequest model) {
    if (model == null) {
      return null;
    }
    return {'offset': model.offset, 'limit': model.limit, 'name': model.name};
  }
}

abstract class CategoryRequestFields {
  static const List<String> allFields = <String>[offset, limit, name];

  static const String offset = 'offset';

  static const String limit = 'limit';

  static const String name = 'name';
}
