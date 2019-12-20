import 'package:tnews_server/src/config/configuaration.dart';
import 'package:tnews_server/src/config/plugins/orm.dart';
import 'package:angel_migration_runner/angel_migration_runner.dart';
import 'package:angel_migration_runner/postgres.dart';
import 'package:file/local.dart';
import 'package:tnews_server/src/models/news.modal.dart';

void main(List<String> args) async {
  var fs = LocalFileSystem();
  var configuration = await loadStandaloneConfiguration(fs);
  var connection = await connectToPostgres(configuration);
  var migrationRunner = PostgresMigrationRunner(connection, migrations: [
    LanguageMigration(),
    CategoryMigration(),
    NewsMigration(),
    ConnectNewsCategoryMigration(),
  ]);
  return await runMigrations(migrationRunner, args);
}
