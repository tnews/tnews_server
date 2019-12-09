import 'package:angel_migration/angel_migration.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'news.modal.g.dart';

@serializable
@Orm(tableName: 'Category')
abstract class _Category extends Model {
  String name;
}

@Orm(tableName: 'News_Category')
@serializable
abstract class _ConnectNewsCategory {
  @belongsTo
  _Category get category;

  @belongsTo
  _News get news;
}

@serializable
@Orm(tableName: 'Language')
abstract class _Language extends Model {
  String name;
}


@Orm(tableName: 'News')
@serializable
abstract class _News extends Model {
  @belongsTo
  _Language lang;

  String source;
  String originId;
  String headline;
  String description;
  List<String> contents;
  String htmlContent;
  String url;
  int status;
  String author;
  List<String> authors;
  String thumbnail;
  int publishedTime;

  @ManyToMany(_ConnectNewsCategory)
  List<_Category> get categories;
}