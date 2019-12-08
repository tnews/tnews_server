import 'dart:io';
import 'package:tnews_server/src/pretty_logging.dart';
import 'package:tnews_server/tnews_server.dart';
import 'package:angel_container/mirrors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_hot/angel_hot.dart';
import 'package:logging/logging.dart';

void main() async {
  // Watch the config/ and web/ directories for changes, and hot-reload the server.
  hierarchicalLoggingEnabled = true;

  HotReloader hot = HotReloader(
    () async {
      Logger logger = Logger.detached('tnews_server')
        ..level = Level.ALL
        ..onRecord.listen(prettyLog);
      Angel app = Angel(logger: logger, reflector: MirrorsReflector());
      await app.configure(configureServer);
      return app;
    },
    <Directory>[
      Directory('config'),
      Directory('lib'),
    ],
  );

  HttpServer server = await hot.startServer('127.0.0.1', 3000);

  print('tnews_server server listening at http://${server.address.address}:${server.port}');
}
