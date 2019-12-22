import 'dart:async';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:tnews_server/src/models/news.modal.dart';
import 'package:tnews_server/src/models/request.modal.dart';

abstract class NewsService extends Service {
  Future<List<News>> getListNews(SearchRequest categoryRequest);

  Future<List<Category>> getCategories(CategoryRequest request);

  Future<List<Language>> getLanguages();

  Future<News> createNews(CreateNewsRequest newsRequest);

  Future<News> getNews(String id);
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
  Future<List<News>> getListNews(SearchRequest request) async {
    final query = NewsQuery()
      ..limit(request.limit)
      ..offset(request.offset);
    return query.get(executor);
  }

  @override
  Future<News> createNews(CreateNewsRequest newsRequest) async {
//    print(newsRequest);
    final query = NewsQuery();
    query.values
      ..source = newsRequest.source
      ..langId = 1
      ..headline = newsRequest.headline
      ..description = newsRequest.description
      ..contents = newsRequest.contents
      ..htmlContent = newsRequest.htmlContent
      ..url = newsRequest.url
      ..status = newsRequest.status
      ..author = newsRequest.author
      ..authors = newsRequest.authors
      ..thumbnail = newsRequest.thumbnail
      ..publishedTime = newsRequest.publishedTime;
    final news = await query.insert(executor);
    print(newsRequest);
    await newsRequest.categoryIds.forEach((id) async {
      final query = ConnectNewsCategoryQuery();
      query.values
        ..newsId = int.parse(news.id)
        ..categoryId = int.parse(id);
      await query.insert(executor);
    });
    return news;
  }

  @override
  Future<News> getNews(String id) {
    final query = NewsQuery()..where.id.equals(int.parse(id));
    return query.get(executor).then((_) => _.first);
  }
}
