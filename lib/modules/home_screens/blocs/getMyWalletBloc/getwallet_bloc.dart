import 'package:backersapp/modules/auth/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getwallet_event.dart';
part 'getwallet_state.dart';

class GetwalletBloc extends Bloc<GetwalletEvent, GetwalletState> {
  AuthRepo _authRepo = AuthRepo();
  GetwalletBloc() : super(GetwalletInitial()) {
    on<GetwalletEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetMyWalletAttempt>((event, emit) => getMyWallet(emit: emit));
  }

  getMyWallet({required Emitter<GetwalletState> emit}) async {
    emit(GetMyWalletLoadingState());
    try {
      double amount = await _authRepo.getMyWallet();
      emit(GetMyWalletSuccessState(amount: amount));
    } catch (e) {
      emit(GetMyWalletFailedState(message: e.toString()));
    }
  }
}
