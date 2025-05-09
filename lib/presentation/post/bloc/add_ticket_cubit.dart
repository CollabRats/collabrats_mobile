import 'package:collabrats_mobile/data/post/data/add_ticket_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTicketCubit extends Cubit<List<AddTicketModel>> {
  AddTicketCubit() : super([]);

  void addTicket(final AddTicketModel data) {
    final updatedList = List<AddTicketModel>.from(state)..add(data);
    emit(updatedList);
  }

  void removeTicket(final AddTicketModel data) {
    final updatedList = List<AddTicketModel>.from(state)..remove(data);
    emit(updatedList);
  }
}
