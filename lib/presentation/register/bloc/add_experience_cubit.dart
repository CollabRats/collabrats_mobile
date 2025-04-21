import 'package:collabrats_mobile/data/register/data/add_experience_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExperienceCubit extends Cubit<List<AddExperienceModel>> {
  AddExperienceCubit() : super([]);
  void addExp(final AddExperienceModel data) {
    final updatedList = List<AddExperienceModel>.from(state)..add(data);
    emit(updatedList);
  }
}
