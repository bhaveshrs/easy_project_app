import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:essay_projects/network_services/api_result_service.dart';
import 'package:essay_projects/src/features/auth/auth_repo.dart';
import 'package:essay_projects/src/features/auth/models/user_model.dart';
import 'package:formz/formz.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    AuthRepo authRepo = AuthRepo();
    on<LogIn>((event, emit) async {
      try {
        emit(
            state.copyWith(loginFormzStatus: FormzSubmissionStatus.inProgress));

        RepoResult? response = await authRepo.logIn(
            payload: UserModel(
                email: event.email ?? "", password: event.pass ?? "").toJson());

        if (response is RepoSuccess) {
          emit(state.copyWith(
              loginFormzStatus: FormzSubmissionStatus.success,
              msg: response.message));
        } else if (response is RepoFailure) {
          emit(state.copyWith(
            loginFormzStatus: FormzSubmissionStatus.failure,
            msg: response.error,
          ));
        }
      } catch (e) {
        emit(state.copyWith(
            loginFormzStatus: FormzSubmissionStatus.failure,
            msg: "something went wrong"));
      }
    });
  }
}
