library tnews_server;

import 'dart:async';
import 'package:angel_framework/angel_framework.dart';
import 'package:file/local.dart';
import 'src/config/config.dart' as configuration;
import 'src/routes/routes.dart' as routes;
import 'src/services/services.dart' as services;

Future configureServer(Angel app) async {
  var fs = const LocalFileSystem();

  await app.configure(configuration.configureServer(fs));
  await app.configure(services.configureServer);
  await app.configure(routes.configureServer(fs));
}
