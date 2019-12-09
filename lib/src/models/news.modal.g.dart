// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.modal.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class CategoryMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('Category', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('name');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('Category');
  }
}

class ConnectNewsCategoryMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('News_Category', (table) {
      table
          .declare('category_id', ColumnType('serial'))
          .references('Category', 'id');
      table.declare('news_id', ColumnType('serial')).references('News', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('News_Category');
  }
}

class LanguageMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('Language', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('name');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('Language');
  }
}

class NewsMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('News', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('source');
      table.varChar('origin_id');
      table.varChar('headline');
      table.varChar('description');
      table.declare('contents', ColumnType('jsonb'));
      table.varChar('html_content');
      table.varChar('url');
      table.integer('status');
      table.varChar('author');
      table.declare('authors', ColumnType('jsonb'));
      table.varChar('thumbnail');
      table.integer('published_time');
      table
          .declare('lang_id', ColumnType('serial'))
          .references('Language', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('News', cascade: true);
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class CategoryQuery extends Query<Category, CategoryQueryWhere> {
  CategoryQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = CategoryQueryWhere(this);
  }

  @override
  final CategoryQueryValues values = CategoryQueryValues();

  CategoryQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'Category';
  }

  @override
  get fields {
    return const ['id', 'created_at', 'updated_at', 'name'];
  }

  @override
  CategoryQueryWhere get where {
    return _where;
  }

  @override
  CategoryQueryWhere newWhereClause() {
    return CategoryQueryWhere(this);
  }

  static Category parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Category(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        name: (row[3] as String));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class CategoryQueryWhere extends QueryWhere {
  CategoryQueryWhere(CategoryQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        name = StringSqlExpressionBuilder(query, 'name');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder name;

  @override
  get expressionBuilders {
    return [id, createdAt, updatedAt, name];
  }
}

class CategoryQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  String get name {
    return (values['name'] as String);
  }

  set name(String value) => values['name'] = value;
  void copyFrom(Category model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    name = model.name;
  }
}

class ConnectNewsCategoryQuery
    extends Query<ConnectNewsCategory, ConnectNewsCategoryQueryWhere> {
  ConnectNewsCategoryQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = ConnectNewsCategoryQueryWhere(this);
    leftJoin('Category', 'category_id', 'id',
        additionalFields: const ['id', 'created_at', 'updated_at', 'name'],
        trampoline: trampoline);
    leftJoin('News', 'news_id', 'id',
        additionalFields: const [
          'id',
          'created_at',
          'updated_at',
          'lang_id',
          'source',
          'origin_id',
          'headline',
          'description',
          'contents',
          'html_content',
          'url',
          'status',
          'author',
          'authors',
          'thumbnail',
          'published_time'
        ],
        trampoline: trampoline);
  }

  @override
  final ConnectNewsCategoryQueryValues values =
      ConnectNewsCategoryQueryValues();

  ConnectNewsCategoryQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'News_Category';
  }

  @override
  get fields {
    return const ['category_id', 'news_id'];
  }

  @override
  ConnectNewsCategoryQueryWhere get where {
    return _where;
  }

  @override
  ConnectNewsCategoryQueryWhere newWhereClause() {
    return ConnectNewsCategoryQueryWhere(this);
  }

  static ConnectNewsCategory parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = ConnectNewsCategory();
    if (row.length > 2) {
      model = model.copyWith(
          category: CategoryQuery.parseRow(row.skip(2).take(4).toList()));
    }
    if (row.length > 6) {
      model = model.copyWith(
          news: NewsQuery.parseRow(row.skip(6).take(16).toList()));
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class ConnectNewsCategoryQueryWhere extends QueryWhere {
  ConnectNewsCategoryQueryWhere(ConnectNewsCategoryQuery query)
      : categoryId = NumericSqlExpressionBuilder<int>(query, 'category_id'),
        newsId = NumericSqlExpressionBuilder<int>(query, 'news_id');

  final NumericSqlExpressionBuilder<int> categoryId;

  final NumericSqlExpressionBuilder<int> newsId;

  @override
  get expressionBuilders {
    return [categoryId, newsId];
  }
}

class ConnectNewsCategoryQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  int get categoryId {
    return (values['category_id'] as int);
  }

  set categoryId(int value) => values['category_id'] = value;
  int get newsId {
    return (values['news_id'] as int);
  }

  set newsId(int value) => values['news_id'] = value;
  void copyFrom(ConnectNewsCategory model) {
    if (model.category != null) {
      values['category_id'] = model.category.id;
    }
    if (model.news != null) {
      values['news_id'] = model.news.id;
    }
  }
}

class LanguageQuery extends Query<Language, LanguageQueryWhere> {
  LanguageQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = LanguageQueryWhere(this);
  }

  @override
  final LanguageQueryValues values = LanguageQueryValues();

  LanguageQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'Language';
  }

  @override
  get fields {
    return const ['id', 'created_at', 'updated_at', 'name'];
  }

  @override
  LanguageQueryWhere get where {
    return _where;
  }

  @override
  LanguageQueryWhere newWhereClause() {
    return LanguageQueryWhere(this);
  }

  static Language parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Language(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        name: (row[3] as String));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class LanguageQueryWhere extends QueryWhere {
  LanguageQueryWhere(LanguageQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        name = StringSqlExpressionBuilder(query, 'name');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder name;

  @override
  get expressionBuilders {
    return [id, createdAt, updatedAt, name];
  }
}

class LanguageQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  String get name {
    return (values['name'] as String);
  }

  set name(String value) => values['name'] = value;
  void copyFrom(Language model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    name = model.name;
  }
}

class NewsQuery extends Query<News, NewsQueryWhere> {
  NewsQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = NewsQueryWhere(this);
    leftJoin('Language', 'lang_id', 'id',
        additionalFields: const ['id', 'created_at', 'updated_at', 'name'],
        trampoline: trampoline);
    leftJoin(ConnectNewsCategoryQuery(trampoline: trampoline), 'id', 'news_id',
        additionalFields: const ['id', 'created_at', 'updated_at', 'name'],
        trampoline: trampoline);
  }

  @override
  final NewsQueryValues values = NewsQueryValues();

  NewsQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'News';
  }

  @override
  get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'lang_id',
      'source',
      'origin_id',
      'headline',
      'description',
      'contents',
      'html_content',
      'url',
      'status',
      'author',
      'authors',
      'thumbnail',
      'published_time'
    ];
  }

  @override
  NewsQueryWhere get where {
    return _where;
  }

  @override
  NewsQueryWhere newWhereClause() {
    return NewsQueryWhere(this);
  }

  static News parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = News(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime),
        updatedAt: (row[2] as DateTime),
        source: (row[4] as String),
        originId: (row[5] as String),
        headline: (row[6] as String),
        description: (row[7] as String),
        contents: (row[8] as List<String>),
        htmlContent: (row[9] as String),
        url: (row[10] as String),
        status: (row[11] as int),
        author: (row[12] as String),
        authors: (row[13] as List<String>),
        thumbnail: (row[14] as String),
        publishedTime: (row[15] as int));
    if (row.length > 16) {
      model = model.copyWith(
          lang: LanguageQuery.parseRow(row.skip(16).take(4).toList()));
    }
    if (row.length > 20) {
      model = model.copyWith(
          categories: [CategoryQuery.parseRow(row.skip(20).take(4).toList())]
              .where((x) => x != null)
              .toList());
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  @override
  bool canCompile(trampoline) {
    return (!(trampoline.contains('News') &&
        trampoline.contains('News_Category')));
  }

  @override
  get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<News>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                categories: List<_Category>.from(l.categories ?? [])
                  ..addAll(model.categories ?? []));
        }
      });
    });
  }

  @override
  update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<News>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                categories: List<_Category>.from(l.categories ?? [])
                  ..addAll(model.categories ?? []));
        }
      });
    });
  }

  @override
  delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<News>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                categories: List<_Category>.from(l.categories ?? [])
                  ..addAll(model.categories ?? []));
        }
      });
    });
  }
}

class NewsQueryWhere extends QueryWhere {
  NewsQueryWhere(NewsQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        langId = NumericSqlExpressionBuilder<int>(query, 'lang_id'),
        source = StringSqlExpressionBuilder(query, 'source'),
        originId = StringSqlExpressionBuilder(query, 'origin_id'),
        headline = StringSqlExpressionBuilder(query, 'headline'),
        description = StringSqlExpressionBuilder(query, 'description'),
        contents = ListSqlExpressionBuilder(query, 'contents'),
        htmlContent = StringSqlExpressionBuilder(query, 'html_content'),
        url = StringSqlExpressionBuilder(query, 'url'),
        status = NumericSqlExpressionBuilder<int>(query, 'status'),
        author = StringSqlExpressionBuilder(query, 'author'),
        authors = ListSqlExpressionBuilder(query, 'authors'),
        thumbnail = StringSqlExpressionBuilder(query, 'thumbnail'),
        publishedTime =
            NumericSqlExpressionBuilder<int>(query, 'published_time');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final NumericSqlExpressionBuilder<int> langId;

  final StringSqlExpressionBuilder source;

  final StringSqlExpressionBuilder originId;

  final StringSqlExpressionBuilder headline;

  final StringSqlExpressionBuilder description;

  final ListSqlExpressionBuilder contents;

  final StringSqlExpressionBuilder htmlContent;

  final StringSqlExpressionBuilder url;

  final NumericSqlExpressionBuilder<int> status;

  final StringSqlExpressionBuilder author;

  final ListSqlExpressionBuilder authors;

  final StringSqlExpressionBuilder thumbnail;

  final NumericSqlExpressionBuilder<int> publishedTime;

  @override
  get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      langId,
      source,
      originId,
      headline,
      description,
      contents,
      htmlContent,
      url,
      status,
      author,
      authors,
      thumbnail,
      publishedTime
    ];
  }
}

class NewsQueryValues extends MapQueryValues {
  @override
  get casts {
    return {'contents': 'jsonb', 'authors': 'jsonb'};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  int get langId {
    return (values['lang_id'] as int);
  }

  set langId(int value) => values['lang_id'] = value;
  String get source {
    return (values['source'] as String);
  }

  set source(String value) => values['source'] = value;
  String get originId {
    return (values['origin_id'] as String);
  }

  set originId(String value) => values['origin_id'] = value;
  String get headline {
    return (values['headline'] as String);
  }

  set headline(String value) => values['headline'] = value;
  String get description {
    return (values['description'] as String);
  }

  set description(String value) => values['description'] = value;
  List<String> get contents {
    return (json.decode((values['contents'] as String)) as List);
  }

  set contents(List<String> value) => values['contents'] = json.encode(value);
  String get htmlContent {
    return (values['html_content'] as String);
  }

  set htmlContent(String value) => values['html_content'] = value;
  String get url {
    return (values['url'] as String);
  }

  set url(String value) => values['url'] = value;
  int get status {
    return (values['status'] as int);
  }

  set status(int value) => values['status'] = value;
  String get author {
    return (values['author'] as String);
  }

  set author(String value) => values['author'] = value;
  List<String> get authors {
    return (json.decode((values['authors'] as String)) as List);
  }

  set authors(List<String> value) => values['authors'] = json.encode(value);
  String get thumbnail {
    return (values['thumbnail'] as String);
  }

  set thumbnail(String value) => values['thumbnail'] = value;
  int get publishedTime {
    return (values['published_time'] as int);
  }

  set publishedTime(int value) => values['published_time'] = value;
  void copyFrom(News model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    source = model.source;
    originId = model.originId;
    headline = model.headline;
    description = model.description;
    contents = model.contents;
    htmlContent = model.htmlContent;
    url = model.url;
    status = model.status;
    author = model.author;
    authors = model.authors;
    thumbnail = model.thumbnail;
    publishedTime = model.publishedTime;
    if (model.lang != null) {
      values['lang_id'] = model.lang.id;
    }
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Category extends _Category {
  Category({this.id, this.createdAt, this.updatedAt, this.name});

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  String name;

  Category copyWith(
      {String id, DateTime createdAt, DateTime updatedAt, String name}) {
    return Category(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name);
  }

  bool operator ==(other) {
    return other is _Category &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, name]);
  }

  @override
  String toString() {
    return "Category(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, name=$name)";
  }

  Map<String, dynamic> toJson() {
    return CategorySerializer.toMap(this);
  }
}

@generatedSerializable
class ConnectNewsCategory implements _ConnectNewsCategory {
  const ConnectNewsCategory({this.category, this.news});

  @override
  final _Category category;

  @override
  final _News news;

  ConnectNewsCategory copyWith({_Category category, _News news}) {
    return ConnectNewsCategory(
        category: category ?? this.category, news: news ?? this.news);
  }

  bool operator ==(other) {
    return other is _ConnectNewsCategory &&
        other.category == category &&
        other.news == news;
  }

  @override
  int get hashCode {
    return hashObjects([category, news]);
  }

  @override
  String toString() {
    return "ConnectNewsCategory(category=$category, news=$news)";
  }

  Map<String, dynamic> toJson() {
    return ConnectNewsCategorySerializer.toMap(this);
  }
}

@generatedSerializable
class Language extends _Language {
  Language({this.id, this.createdAt, this.updatedAt, this.name});

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  String name;

  Language copyWith(
      {String id, DateTime createdAt, DateTime updatedAt, String name}) {
    return Language(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name);
  }

  bool operator ==(other) {
    return other is _Language &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name;
  }

  @override
  int get hashCode {
    return hashObjects([id, createdAt, updatedAt, name]);
  }

  @override
  String toString() {
    return "Language(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, name=$name)";
  }

  Map<String, dynamic> toJson() {
    return LanguageSerializer.toMap(this);
  }
}

@generatedSerializable
class News extends _News {
  News(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.lang,
      this.source,
      this.originId,
      this.headline,
      this.description,
      List<String> contents,
      this.htmlContent,
      this.url,
      this.status,
      this.author,
      List<String> authors,
      this.thumbnail,
      this.publishedTime,
      List<_Category> categories})
      : this.contents = List.unmodifiable(contents ?? []),
        this.authors = List.unmodifiable(authors ?? []),
        this.categories = List.unmodifiable(categories ?? []);

  /// A unique identifier corresponding to this item.
  @override
  String id;

  /// The time at which this item was created.
  @override
  DateTime createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime updatedAt;

  @override
  _Language lang;

  @override
  String source;

  @override
  String originId;

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
  String thumbnail;

  @override
  int publishedTime;

  @override
  final List<_Category> categories;

  News copyWith(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      _Language lang,
      String source,
      String originId,
      String headline,
      String description,
      List<String> contents,
      String htmlContent,
      String url,
      int status,
      String author,
      List<String> authors,
      String thumbnail,
      int publishedTime,
      List<_Category> categories}) {
    return News(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lang: lang ?? this.lang,
        source: source ?? this.source,
        originId: originId ?? this.originId,
        headline: headline ?? this.headline,
        description: description ?? this.description,
        contents: contents ?? this.contents,
        htmlContent: htmlContent ?? this.htmlContent,
        url: url ?? this.url,
        status: status ?? this.status,
        author: author ?? this.author,
        authors: authors ?? this.authors,
        thumbnail: thumbnail ?? this.thumbnail,
        publishedTime: publishedTime ?? this.publishedTime,
        categories: categories ?? this.categories);
  }

  bool operator ==(other) {
    return other is _News &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.lang == lang &&
        other.source == source &&
        other.originId == originId &&
        other.headline == headline &&
        other.description == description &&
        ListEquality<String>(DefaultEquality<String>())
            .equals(other.contents, contents) &&
        other.htmlContent == htmlContent &&
        other.url == url &&
        other.status == status &&
        other.author == author &&
        ListEquality<String>(DefaultEquality<String>())
            .equals(other.authors, authors) &&
        other.thumbnail == thumbnail &&
        other.publishedTime == publishedTime &&
        ListEquality<_Category>(DefaultEquality<_Category>())
            .equals(other.categories, categories);
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      lang,
      source,
      originId,
      headline,
      description,
      contents,
      htmlContent,
      url,
      status,
      author,
      authors,
      thumbnail,
      publishedTime,
      categories
    ]);
  }

  @override
  String toString() {
    return "News(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, lang=$lang, source=$source, originId=$originId, headline=$headline, description=$description, contents=$contents, htmlContent=$htmlContent, url=$url, status=$status, author=$author, authors=$authors, thumbnail=$thumbnail, publishedTime=$publishedTime, categories=$categories)";
  }

  Map<String, dynamic> toJson() {
    return NewsSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const CategorySerializer categorySerializer = CategorySerializer();

class CategoryEncoder extends Converter<Category, Map> {
  const CategoryEncoder();

  @override
  Map convert(Category model) => CategorySerializer.toMap(model);
}

class CategoryDecoder extends Converter<Map, Category> {
  const CategoryDecoder();

  @override
  Category convert(Map map) => CategorySerializer.fromMap(map);
}

class CategorySerializer extends Codec<Category, Map> {
  const CategorySerializer();

  @override
  get encoder => const CategoryEncoder();
  @override
  get decoder => const CategoryDecoder();
  static Category fromMap(Map map) {
    return Category(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        name: map['name'] as String);
  }

  static Map<String, dynamic> toMap(_Category model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'name': model.name
    };
  }
}

abstract class CategoryFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    name
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String name = 'name';
}

const ConnectNewsCategorySerializer connectNewsCategorySerializer =
    ConnectNewsCategorySerializer();

class ConnectNewsCategoryEncoder extends Converter<ConnectNewsCategory, Map> {
  const ConnectNewsCategoryEncoder();

  @override
  Map convert(ConnectNewsCategory model) =>
      ConnectNewsCategorySerializer.toMap(model);
}

class ConnectNewsCategoryDecoder extends Converter<Map, ConnectNewsCategory> {
  const ConnectNewsCategoryDecoder();

  @override
  ConnectNewsCategory convert(Map map) =>
      ConnectNewsCategorySerializer.fromMap(map);
}

class ConnectNewsCategorySerializer extends Codec<ConnectNewsCategory, Map> {
  const ConnectNewsCategorySerializer();

  @override
  get encoder => const ConnectNewsCategoryEncoder();
  @override
  get decoder => const ConnectNewsCategoryDecoder();
  static ConnectNewsCategory fromMap(Map map) {
    return ConnectNewsCategory(
        category: map['category'] != null
            ? CategorySerializer.fromMap(map['category'] as Map)
            : null,
        news: map['news'] != null
            ? NewsSerializer.fromMap(map['news'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_ConnectNewsCategory model) {
    if (model == null) {
      return null;
    }
    return {
      'category': CategorySerializer.toMap(model.category),
      'news': NewsSerializer.toMap(model.news)
    };
  }
}

abstract class ConnectNewsCategoryFields {
  static const List<String> allFields = <String>[category, news];

  static const String category = 'category';

  static const String news = 'news';
}

const LanguageSerializer languageSerializer = LanguageSerializer();

class LanguageEncoder extends Converter<Language, Map> {
  const LanguageEncoder();

  @override
  Map convert(Language model) => LanguageSerializer.toMap(model);
}

class LanguageDecoder extends Converter<Map, Language> {
  const LanguageDecoder();

  @override
  Language convert(Map map) => LanguageSerializer.fromMap(map);
}

class LanguageSerializer extends Codec<Language, Map> {
  const LanguageSerializer();

  @override
  get encoder => const LanguageEncoder();
  @override
  get decoder => const LanguageDecoder();
  static Language fromMap(Map map) {
    return Language(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        name: map['name'] as String);
  }

  static Map<String, dynamic> toMap(_Language model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'name': model.name
    };
  }
}

abstract class LanguageFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    name
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String name = 'name';
}

const NewsSerializer newsSerializer = NewsSerializer();

class NewsEncoder extends Converter<News, Map> {
  const NewsEncoder();

  @override
  Map convert(News model) => NewsSerializer.toMap(model);
}

class NewsDecoder extends Converter<Map, News> {
  const NewsDecoder();

  @override
  News convert(Map map) => NewsSerializer.fromMap(map);
}

class NewsSerializer extends Codec<News, Map> {
  const NewsSerializer();

  @override
  get encoder => const NewsEncoder();
  @override
  get decoder => const NewsDecoder();
  static News fromMap(Map map) {
    return News(
        id: map['id'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        lang: map['lang'] != null
            ? LanguageSerializer.fromMap(map['lang'] as Map)
            : null,
        source: map['source'] as String,
        originId: map['origin_id'] as String,
        headline: map['headline'] as String,
        description: map['description'] as String,
        contents: map['contents'] is Iterable
            ? (map['contents'] as Iterable).cast<String>().toList()
            : null,
        htmlContent: map['html_content'] as String,
        url: map['url'] as String,
        status: map['status'] as int,
        author: map['author'] as String,
        authors: map['authors'] is Iterable
            ? (map['authors'] as Iterable).cast<String>().toList()
            : null,
        thumbnail: map['thumbnail'] as String,
        publishedTime: map['published_time'] as int,
        categories: map['categories'] is Iterable
            ? List.unmodifiable(
                ((map['categories'] as Iterable).whereType<Map>())
                    .map(CategorySerializer.fromMap))
            : null);
  }

  static Map<String, dynamic> toMap(_News model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'lang': LanguageSerializer.toMap(model.lang),
      'source': model.source,
      'origin_id': model.originId,
      'headline': model.headline,
      'description': model.description,
      'contents': model.contents,
      'html_content': model.htmlContent,
      'url': model.url,
      'status': model.status,
      'author': model.author,
      'authors': model.authors,
      'thumbnail': model.thumbnail,
      'published_time': model.publishedTime,
      'categories':
          model.categories?.map((m) => CategorySerializer.toMap(m))?.toList()
    };
  }
}

abstract class NewsFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    lang,
    source,
    originId,
    headline,
    description,
    contents,
    htmlContent,
    url,
    status,
    author,
    authors,
    thumbnail,
    publishedTime,
    categories
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String lang = 'lang';

  static const String source = 'source';

  static const String originId = 'origin_id';

  static const String headline = 'headline';

  static const String description = 'description';

  static const String contents = 'contents';

  static const String htmlContent = 'html_content';

  static const String url = 'url';

  static const String status = 'status';

  static const String author = 'author';

  static const String authors = 'authors';

  static const String thumbnail = 'thumbnail';

  static const String publishedTime = 'published_time';

  static const String categories = 'categories';
}
