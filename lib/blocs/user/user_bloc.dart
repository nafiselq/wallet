import 'package:bank_sha/services/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetByUsername) {
        try {
          emit(UserLoading());

          final users = await UserServices().getUserByUsername(event.username);

          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }

      if (event is UserGetRecent) {
        try {
          emit(UserLoading());

          final users = await UserServices().getRecentUser();
          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
