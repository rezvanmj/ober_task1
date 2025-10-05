import '../../domain/repositories/map_repository.dart';
import '../data_sources/map_remote_data.dart';

class MapRepositoryImp extends MapRepository {
  MapRemoteData mapRemoteData;
  MapRepositoryImp({required this.mapRemoteData});
}
