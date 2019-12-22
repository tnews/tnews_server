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
    return SearchRequest(offset: offset ?? this.offset, limit: limit ?? this.limit);
  }

  bool operator ==(other) {
    return other is _SearchRequest && other.offset == offset && other.limit == limit;
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
        offset: offset ?? this.offset, limit: limit ?? this.limit, name: name ?? this.name);
  }

  bool operator ==(other) {
    return other is _CategoryRequest && other.offset == offset && other.limit == limit && other.name == name;
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

@generatedSerializable
class CreateNewsRequest extends _CreateNewsRequest {
  CreateNewsRequest(
      {this.source,
      this.headline,
      this.description,
      List<String> contents,
      this.htmlContent,
      this.url,
      this.status,
      this.author,
      List<String> authors,
      List<String> categoryIds,
      this.thumbnail,
      this.publishedTime})
      : this.contents = List.unmodifiable(contents ?? []),
        this.authors = List.unmodifiable(authors ?? []),
        this.categoryIds = List.unmodifiable(categoryIds ?? []);

  @override
  String source;

  @override
  String headline;

  @override
  String description;

  @override
  List<String> contents;

  @override
  String htmlContent;

  @override
  String url;

  @override
  int status;

  @override
  String author;

  @override
  List<String> authors;

  @override
  List<String> categoryIds;

  @override
  String thumbnail;

  @override
  int publishedTime;

  CreateNewsRequest copyWith(
      {String source,
      String headline,
      String description,
      List<String> contents,
      String htmlContent,
      String url,
      int status,
      String author,
      List<String> authors,
      List<String> categoryIds,
      String thumbnail,
      int publishedTime}) {
    return CreateNewsRequest(
        source: source ?? this.source,
        headline: headline ?? this.headline,
        description: description ?? this.description,
        contents: contents ?? this.contents,
        htmlContent: htmlContent ?? this.htmlContent,
        url: url ?? this.url,
        status: status ?? this.status,
        author: author ?? this.author,
        authors: authors ?? this.authors,
        categoryIds: categoryIds ?? this.categoryIds,
        thumbnail: thumbnail ?? this.thumbnail,
        publishedTime: publishedTime ?? this.publishedTime);
  }

  bool operator ==(other) {
    return other is _CreateNewsRequest &&
        other.source == source &&
        other.headline == headline &&
        other.description == description &&
        ListEquality<String>(DefaultEquality<String>()).equals(other.contents, contents) &&
        other.htmlContent == htmlContent &&
        other.url == url &&
        other.status == status &&
        other.author == author &&
        ListEquality<String>(DefaultEquality<String>()).equals(other.authors, authors) &&
        ListEquality<String>(DefaultEquality<String>()).equals(other.categoryIds, categoryIds) &&
        other.thumbnail == thumbnail &&
        other.publishedTime == publishedTime;
  }

  @override
  int get hashCode {
    return hashObjects([
      source,
      headline,
      description,
      contents,
      htmlContent,
      url,
      status,
      author,
      authors,
      categoryIds,
      thumbnail,
      publishedTime
    ]);
  }

  @override
  String toString() {
    return "CreateNewsRequest(source=$source, headline=$headline, description=$description, contents=$contents, htmlContent=$htmlContent, url=$url, status=$status, author=$author, authors=$authors, categoryIds=$categoryIds, thumbnail=$thumbnail, publishedTime=$publishedTime)";
  }

  Map<String, dynamic> toJson() {
    return CreateNewsRequestSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const SearchRequestSerializer searchRequestSerializer = SearchRequestSerializer();

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
    return SearchRequest(offset: map['offset'] as int ?? 0, limit: map['limit'] as int ?? 10);
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

const CategoryRequestSerializer categoryRequestSerializer = CategoryRequestSerializer();

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

const CreateNewsRequestSerializer createNewsRequestSerializer = CreateNewsRequestSerializer();

class CreateNewsRequestEncoder extends Converter<CreateNewsRequest, Map> {
  const CreateNewsRequestEncoder();

  @override
  Map convert(CreateNewsRequest model) => CreateNewsRequestSerializer.toMap(model);
}

class CreateNewsRequestDecoder extends Converter<Map, CreateNewsRequest> {
  const CreateNewsRequestDecoder();

  @override
  CreateNewsRequest convert(Map map) => CreateNewsRequestSerializer.fromMap(map);
}

class CreateNewsRequestSerializer extends Codec<CreateNewsRequest, Map> {
  const CreateNewsRequestSerializer();

  @override
  get encoder => const CreateNewsRequestEncoder();

  @override
  get decoder => const CreateNewsRequestDecoder();

  static CreateNewsRequest fromMap(Map map) {
    return CreateNewsRequest(
        source: map['source'] as String,
        headline: map['headline'] as String,
        description: map['description'] as String,
        contents: map['contents'] != null ? json.decode(map['contents']).cast<String>().toList() : null,
        htmlContent: map['html_content'] as String,
        url: map['url'] as String,
        status: int.tryParse(map['status']?.toString() ?? '0'),
        author: map['author'] as String,
        authors: map['authors'] != null ? json.decode(map['authors']).cast<String>().toList() : null,
        categoryIds:
            map['category_ids'] != null ? json.decode(map['category_ids']).cast<String>().toList() : null,
        thumbnail: map['thumbnail'] as String,
        publishedTime: int.tryParse(map['published_time']?.toString() ?? 0));
  }

  static Map<String, dynamic> toMap(_CreateNewsRequest model) {
    if (model == null) {
      return null;
    }
    return {
      'source': model.source,
      'headline': model.headline,
      'description': model.description,
      'contents': model.contents,
      'html_content': model.htmlContent,
      'url': model.url,
      'status': model.status,
      'author': model.author,
      'authors': model.authors,
      'category_ids': model.categoryIds,
      'thumbnail': model.thumbnail,
      'published_time': model.publishedTime
    };
  }
}

abstract class CreateNewsRequestFields {
  static const List<String> allFields = <String>[
    source,
    headline,
    description,
    contents,
    htmlContent,
    url,
    status,
    author,
    authors,
    categoryIds,
    thumbnail,
    publishedTime
  ];

  static const String source = 'source';

  static const String headline = 'headline';

  static const String description = 'description';

  static const String contents = 'contents';

  static const String htmlContent = 'html_content';

  static const String url = 'url';

  static const String status = 'status';

  static const String author = 'author';

  static const String authors = 'authors';

  static const String categoryIds = 'category_ids';

  static const String thumbnail = 'thumbnail';

  static const String publishedTime = 'published_time';
}
