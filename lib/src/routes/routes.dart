library tnews_server.src.routes;

import 'package:angel_cors/angel_cors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_static/angel_static.dart';
import 'package:file/file.dart';
import 'controllers/controllers.dart' as controllers;

AngelConfigurer configureServer(FileSystem fileSystem) {
  return (Angel app) async {
    await app.configure(controllers.configureServer);

    if (!app.environment.isProduction) {
      var vDir = VirtualDirectory(
        app,
        fileSystem,
        source: fileSystem.directory('web'),
      );
      app.fallback(vDir.handleRequest);
    }

    app
      ..fallback(cors(CorsOptions(allowedHeaders: ['GET', 'POST', 'PUT', 'DELETE'])))
      ..get('/', (req, res) => res.redirect('https://github.com/tvc12'))
      ..fallback((req, res) => throw AngelHttpException.notFound())
      ..errorHandler = (e, req, res) => res.json(
            TNewsApi(
              success: false,
              data: TNewsException(
                message: e.message,
                errorCode: e.error?.toString(),
                statusCode: e.statusCode,
              ),
            ),
          );
  };
}

class TNewsApi {
  bool success;
  dynamic data;
  TNewsApi({this.success, this.data});

  Map toJson() => {'success': success, 'data': data.toJson()};
}

class TNewsException {
  String errorCode;
  int statusCode;
  String message;
  TNewsException({this.errorCode, this.statusCode, this.message});

  Map toJson() => {
        'error_code': errorCode,
        'status_code': statusCode,
        'message': message,
      };
}
