import 'package:collabrats_mobile/data/register/data/add_education_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEducationCubit extends Cubit<List<AddEducationModel>> {
  AddEducationCubit() : super([]);
  void addExp(final AddEducationModel data) {
    final updatedList = List<AddEducationModel>.from(state)..add(data);
    emit(updatedList);
  }
}
