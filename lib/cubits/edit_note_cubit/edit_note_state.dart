part of 'edit_note_cubit.dart';

@immutable
sealed class EditNoteState {}

final class EditNoteInitial extends EditNoteState {}

final class EditNoteLoading extends EditNoteState {}

final class EditNoteSuccess extends EditNoteState {}

final class EditNoteFailure extends EditNoteState {
  final String error;

  EditNoteFailure({required this.error});
}
