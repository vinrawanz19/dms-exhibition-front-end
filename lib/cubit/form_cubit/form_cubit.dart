import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:indomobil_exhibition_front_end/api/service/content_service.dart';
import 'package:indomobil_exhibition_front_end/api/service/form_service.dart';
import 'package:indomobil_exhibition_front_end/models/content_model.dart';
import 'package:indomobil_exhibition_front_end/models/form_model.dart';
import 'package:meta/meta.dart';

part 'form_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(FormCubitState());

  void initForm(String companyId) async {
    try {
      emit(FormLoading());
      ContentModel data = await ContentService.getContent(companyId);
      emit(FormLoaded(content: data));
    } catch (e) {
      emit(FormError(message: e.toString()));
    }
  }

  void insertForm(FormModel data) async {
    try {
      var curState = state as FormLoaded;
      emit(FormLoading());
      await FormService.createForm(data);
      emit(FormSubmit());
      emit(curState);
    } catch (e) {
      emit(FormError(message: e.toString()));
    }
  }
}
