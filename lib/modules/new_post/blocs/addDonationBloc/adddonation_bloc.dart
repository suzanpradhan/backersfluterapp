import 'package:backersapp/modules/home_screens/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adddonation_event.dart';
part 'adddonation_state.dart';

class AdddonationBloc extends Bloc<AdddonationEvent, AdddonationState> {
  Postrepo _postrepo = Postrepo();
  AdddonationBloc() : super(AdddonationInitial()) {
    on<AdddonationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddDonationAttempt>(
        (event, emit) => addDonation(emit: emit, event: event));
  }

  addDonation(
      {required AddDonationAttempt event,
      required Emitter<AdddonationState> emit}) async {
    emit(AddDonationLoadingState());

    try {
      String message = await _postrepo.createDonation(
          amount: double.parse(event.amount), postId: event.postID);

      emit(AddDonationSuccessState(message: message));
    } catch (e) {
      emit(AddDonationFailedState(message: e.toString()));
    }
  }
}
