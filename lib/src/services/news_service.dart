import 'dart:async';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:tnews_server/src/models/news.modal.dart';
import 'package:tnews_server/src/models/request.modal.dart';

abstract class NewsService extends Service {
  Future<List<News>> getNews();

  Future<List<Category>> getCategories(CategoryRequest request);

  Future<List<Language>> getLanguages();
}

class NewsServiceImpl extends NewsService {
  final CategoryQuery categoryQuery;
  final QueryExecutor executor;

  NewsServiceImpl(this.categoryQuery, this.executor);

  @override
  Future<List<Category>> getCategories(CategoryRequest request) {
    final query = CategoryQuery()
      ..offset(request.offset)
      ..limit(request.limit);
    if (request.name != '') {
      query.where.name.equals(request.name);
    }
    return query.get(executor);
  }

  @override
  Future<List<Language>> getLanguages() async {
    final query = LanguageQuery();
    return query.get(executor);
  }

  @override
  Future<List<News>> getNews() async {
    return [];
  }
}
