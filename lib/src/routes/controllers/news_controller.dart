import 'package:angel_framework/angel_framework.dart';
import 'package:tnews_server/src/models/news.modal.dart';
import 'package:tnews_server/src/models/request.modal.dart';
import 'package:tnews_server/src/services/news_service.dart';

@Expose('/news')
class NewsController extends Controller {
  final NewsService service;

  NewsController(this.service);

  @Expose('/', method: 'GET', middleware: [parseSearchRequest])
  Future<List<News>> getListNews(SearchRequest searchRequest) {
    return service.getListNews(searchRequest);
  }

  @Expose('/:id', method: 'GET')
  Future<News> getNews(String id) {
    return service.getNews(id);
  }

  @Expose('/', method: 'POST', middleware: [parseNewsRequest])
  Future<News> createNews(CreateNewsRequest newsRequest) {
    return service.createNews(newsRequest);
  }

  @Expose('/category', method: 'GET', middleware: [parseCategoryRequest])
  Future<List<Category>> getCategories(CategoryRequest categoryRequest) async {
    return service.getCategories(categoryRequest);
  }

  @Expose('/language', method: 'GET')
  Future<List<Language>> getLanguage() {
    return service.getLanguages();
  }
}

Future<bool> parseSearchRequest(RequestContext req, res) async {
  req.queryParameters['offset'] = int.tryParse(req.queryParameters['offset'] ?? '0');
  req.queryParameters['limit'] = int.tryParse(req.queryParameters['limit'] ?? '10');

  final SearchRequest searchRequest = SearchRequestDecoder().convert(req.queryParameters);
  req.params['searchRequest'] = searchRequest;
  return true;
}

Future<bool> parseNewsRequest(RequestContext req, res) async {
  await req.parseBody();
  final createNewsRequest = CreateNewsRequestDecoder().convert(req.bodyAsMap);
  req.params['newsRequest'] = createNewsRequest;
  return true;
}

Future<bool> parseCategoryRequest(RequestContext req, res) async {
  req.queryParameters['offset'] = int.tryParse(req.queryParameters['offset'] ?? '0');
  req.queryParameters['limit'] = int.tryParse(req.queryParameters['limit'] ?? '10');

  final categoryRequest = CategoryRequestDecoder().convert(req.queryParameters);
  req.params['categoryRequest'] = categoryRequest;
  return true;
}
