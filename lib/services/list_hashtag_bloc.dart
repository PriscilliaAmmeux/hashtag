import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_images/models/hashtag_model.dart';

part 'list_hashtag_event.dart';
part 'list_hashtag_state.dart';

class ListHashtagBloc extends Bloc<ListHastagEvent, ListHashtagState> {
  final List<Map<String, dynamic>> listHashtag;

  ListHashtagBloc(
    this.listHashtag,
  ) : super(const ListHashtagInitialState(listHashtag: <HashtagModel>[])) {
    on<OnInitializeListHashtagEvent>((event, emit) {
      List<HashtagModel> listHashtagModel = listHashtag
          .map(
            (e) => HashtagModel(name: e["name"]),
          )
          .toList();

      emit(ListHashtagInitialState(listHashtag: listHashtagModel));
    });
  }
}
