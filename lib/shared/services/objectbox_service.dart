import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:troodking_app/objectbox.g.dart';
import 'package:troodking_app/shared/models/troodking_model.dart';

class ObjectboxService {
  late final Store store;
  late final Box<TroodkingModel> troodkingModelBox;

  static ObjectboxService? _instance;
  static bool get isInitialized => _instance != null;



  ObjectboxService._create(this.store) {
    troodkingModelBox = store.box<TroodkingModel>();
  }

   static ObjectboxService get instance {
    if (!isInitialized) {
      throw Exception("ObjectBox no ha sido inicializado.");
    }
    return _instance!;
  }

  static Future<ObjectboxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx"));
    _instance = ObjectboxService._create(store);
    return _instance!;
  }

  List<TroodkingModel> getCategories() {
    return troodkingModelBox.getAll();
  }

  Future<void> createCategory(TroodkingModel troodking) async {
    troodkingModelBox.put(troodking);
  }

  Future<void> deleteCategory(int id) async {
    troodkingModelBox.remove(id);
  }
}
