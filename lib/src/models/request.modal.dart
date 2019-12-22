import 'package:angel_serialize/angel_serialize.dart';

part 'request.modal.g.dart';

@Serializable()
abstract class _SearchRequest {
  @SerializableField(defaultValue: 0)
  int offset;
  @SerializableField(defaultValue: 10)
  int limit;
  String categoryId;
}

@Serializable()
class _CategoryRequest extends _SearchRequest {
  @SerializableField(defaultValue: '')
  String name;
}

@Serializable()
class _CreateNewsRequest {
  String source;
  String headline;
  String description;
  List<String> contents;
  String htmlContent;
  String url;
  int status;
  String author;
  List<String> authors;
  List<String> categoryIds;
  String thumbnail;
  int publishedTime;
}
