import 'dart:async';
import 'dart:io';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_orm_postgres/angel_orm_postgres.dart';
import 'package:postgres/postgres.dart';

Future<void> configureServer(Angel app) async {
  var connection = await connectToPostgres(app.configuration);
  await connection.open();

  var logger = app.environment.isProduction ? null : app.logger;
  var executor = PostgreSqlExecutor(connection, logger: logger);

  app
    ..container.registerSingleton<QueryExecutor>(executor)
    ..shutdownHooks.add((_) => connection.close());
}

Future<PostgreSQLConnection> connectToPostgres(Map configuration) async {
  var postgresConfig = configuration['postgres'] as Map ?? {};
  final port = int.tryParse(postgresConfig['port'] ?? '5432');
  final useSSL = (postgresConfig['use_ssl'] as String)?.toLowerCase() == 'true';
  var connection = PostgreSQLConnection(
    postgresConfig['host'] as String ?? 'localhost',
    port ?? 5432,
    postgresConfig['database_name'] as String ??
        Platform.environment['USER'] ??
        Platform.environment['USERNAME'],
    username: postgresConfig['username'] as String,
    password: postgresConfig['password'] as String,
    timeZone: postgresConfig['time_zone'] as String ?? 'UTC',
    timeoutInSeconds: int.tryParse(postgresConfig['timeout_in_seconds'] ?? '30') ?? 30,
    useSSL: useSSL,
  );
  return connection;
}
