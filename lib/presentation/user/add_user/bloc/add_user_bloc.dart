part of 'add_user_extender.dart';

class AddUserBloc extends GetxController with _Extender {
  final RegisterUserUsecase registerUserUsecase;
  AddUserBloc({required this.registerUserUsecase});

  @override
  void onClose() {
    (this)._dispose();
    super.onClose();
  }

  void register() async {
    registerCase(LoadingCase());
    final response = await registerUserUsecase.register({
      //PERSONAL
      "name": nameCo.text,
      "email": emailCo.text,
      "birthPlace": birthPlaceCo.text,
      "birthDate": '${birthDateCo.text.dateFormat(
        currentFormat: "MM/dd/yyyy",
        desiredFormat: "yyyy-MM-dd",
      )}T00:00:00+07:00',
      "phone": phoneCo.text,

      //ROLE
      "roleId": roleVal?.roleId,
      "bsiAccount": bsiAccountCo.text,
      "joinDate": '${joinDateCo.text.dateFormat(
        currentFormat: "MM/dd/yyyy",
        desiredFormat: "yyyy-MM-dd",
      )}T00:00:00+07:00',
      "npwp": npwpCo.text,
      'bpjs': bpjsCo.text,

      //IDENTITY
      "ktp": ktpCo.text,
      "genderId": genderVal?.id,
      "employmentStatusId": employmentVal?.id,
      'marritalStatusId': maritalStatusVal?.id,
      "lastEducationId": educationVal?.id,
      'religionId': religionVal?.id,
      'bloodTypeId': bloodVal?.id,
      'ktpAddress': ktpAddressCo.text,
      "domicileAddress": domicileAddressCo.text,
    });

    response.fold(
      (failure) => registerCase(ErrorCase(failure)),
      (result) => registerCase(LoadedCase(result)),
    );
  }
}
