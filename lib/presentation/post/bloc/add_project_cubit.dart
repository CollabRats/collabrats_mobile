import 'package:collabrats_mobile/data/post/data/add_project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProjectCubit extends Cubit<List<AddProjectModel>> {
  AddProjectCubit() : super([]);

  void addProject(final AddProjectModel data) {
    final updatedList = List<AddProjectModel>.from(state)..add(data);
    emit(updatedList);
  }

  void removeProject(final AddProjectModel data) {
    final updatedList = List<AddProjectModel>.from(state)..remove(data);
    emit(updatedList);
  }
}
