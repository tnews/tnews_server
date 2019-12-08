import 'package:angel_framework/angel_framework.dart';

AngelConfigurer configureServer() {
  return (Angel app) async {
    app.use('/api/news', MapService());
  };
}
