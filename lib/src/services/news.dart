import 'package:angel_framework/angel_framework.dart';

class NewsService extends Service {}

AngelConfigurer configureServer() {
  return (Angel app) async {
    app.use('/api/news', NewsService());
  };
}
