import 'package:dbro_admin/presentation/rail/bloc/rail_extender.dart';
import 'package:get/get.dart';

class RegisterPresentation {
  RegisterPresentation() {
    Get.put(
      RailBloc(
        permissionUsecase: Get.find(),
        localUsecase: Get.find(),
      ),
      permanent: true,
    );
  }
}
