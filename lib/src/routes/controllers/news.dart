import 'package:angel_framework/angel_framework.dart';

@Expose('/news')
class NewsController extends Controller {
  @Expose('/')
  String hello() {
    return 'Hello, world';
  }
}
