part of 'list_hashtag_bloc.dart';

abstract class ListHastagEvent extends Equatable {
  const ListHastagEvent();

  @override
  List<Object> get props => [];
}

class OnInitializeListHashtagEvent extends ListHastagEvent {}
