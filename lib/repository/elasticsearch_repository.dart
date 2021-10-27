import 'package:kta/provider/elasticsearch_provider.dart';

class ElasticsearchRepository {
  final ElasticsearchProvider provider;

  ElasticsearchRepository(this.provider);

  Future<dynamic> getMember(String id) => provider.getMember(id);
}
