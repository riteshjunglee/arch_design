part of 'super_list_bloc.dart';

sealed class SuperListState extends Equatable {
  const SuperListState();
  
  @override
  List<Object> get props => [];
}

final class SuperListInitial extends SuperListState {}
