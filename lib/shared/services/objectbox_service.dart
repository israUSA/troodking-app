import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:troodking_app/objectbox.g.dart';
import 'package:troodking_app/shared/models/troodking_model.dart';

class ObjectboxService {
  late final Store store;
  late final Box<TroodkingModel> troodkingModelBox;

  ObjectboxService._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  static Future<ObjectboxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx"));
    return ObjectboxService._create(store);
  }


  Future<void> createCategory(TroodkingModel troodking) async {

    troodkingModelBox.put(troodking);
  }

  Future<void> deleteCategory() async {

  }
}