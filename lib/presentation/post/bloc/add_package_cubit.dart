import 'package:collabrats_mobile/data/post/data/add_package_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPackageCubit extends Cubit<List<AddPackageModel>> {
  AddPackageCubit() : super([]);

  void addPackage(final AddPackageModel data) {
    final updatedList = List<AddPackageModel>.from(state)..add(data);
    emit(updatedList);
  }

  void removePackage(final AddPackageModel data) {
    final updatedList = List<AddPackageModel>.from(state)..remove(data);
    emit(updatedList);
  }
}
