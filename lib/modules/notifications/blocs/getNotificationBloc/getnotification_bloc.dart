import 'package:backersapp/modules/notifications/models/notification_models.dart';
import 'package:backersapp/modules/notifications/repo/notification_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getnotification_event.dart';
part 'getnotification_state.dart';

class GetnotificationBloc
    extends Bloc<GetnotificationEvent, GetnotificationState> {
  NotificationRepo _notificationRepo = NotificationRepo();
  GetnotificationBloc() : super(GetnotificationInitial()) {
    on<GetnotificationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetMyNotifications>(
        (event, emit) => addNewPostMap(emit: emit, event: event));
  }

  addNewPostMap(
      {required GetMyNotifications event,
      required Emitter<GetnotificationState> emit}) async {
    emit(GetMyNotificationsLoadingState());

    try {
      List<NotificationModel> data = await _notificationRepo.getNotification();
      emit(GetMyNotificationsSuccessState(notificationList: data));
    } catch (e) {
      emit(GetMyNotificationsFailedState(message: e.toString()));
    }
  }
}
