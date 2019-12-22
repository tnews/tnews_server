import 'package:angel_framework/angel_framework.dart';
import 'package:tnews_server/src/models/news.modal.dart';
import 'package:tnews_server/src/models/request.modal.dart';
import 'package:tnews_server/src/services/news_service.dart';

@Expose('/news')
class NewsController extends Controller {
  final NewsService service;

  NewsController(this.service);

  @Expose('/', method: 'GET')
  Future<List<News>> getNews() {
    return service.getNews();
  }

  @Expose('/category', method: 'GET', middleware: [parseCategoryRequest])
  Future<List<Category>> getCategories(CategoryRequest categoryRequest) async {
    return service.getCategories(categoryRequest);
  }
}

Future<bool> parseCategoryRequest(RequestContext req, res) async {
  req.queryParameters['offset'] = int.tryParse(req.queryParameters['offset'] ?? '0');
  req.queryParameters['limit'] = int.tryParse(req.queryParameters['limit'] ?? '10');

  final categoryRequest = CategoryRequestDecoder().convert(req.queryParameters);
  req.params['categoryRequest'] = categoryRequest;
  return true;
}
