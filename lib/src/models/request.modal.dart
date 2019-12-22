import 'package:angel_framework/angel_framework.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'request.modal.g.dart';

abstract class _SearchRequest {
  @SerializableField(defaultValue: 0)
  int offset;
  @SerializableField(defaultValue: 10)
  int limit;
}

@Serializable()
class _CategoryRequest extends _SearchRequest {
  @SerializableField(defaultValue: '')
  String name;
}
