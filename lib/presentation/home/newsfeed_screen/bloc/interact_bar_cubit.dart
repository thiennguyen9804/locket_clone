import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locket_clone/domain/entities/post_entity.dart';
import 'package:locket_clone/domain/usecases/get_current_user_use_case.dart';
import 'package:locket_clone/set_up_sl.dart';

part 'interact_bar_state.dart';

class InteractBarCubit extends Cubit<InteractBarState> {
  InteractBarCubit() : super(NoInteractBar());

  void setInteractBar(PostEntity post) async {
    emit(InteractBarLoading());
    final currentUser = await sl<GetCurrentUserUseCase>().call();
    if(post.user.id == currentUser.id) {
      emit(MyInteractBarState());
    } else {
      emit(OthersInteractBarState());
    }
  }

  void setNoInteractBar() {
    emit(NoInteractBar());
  }
}
