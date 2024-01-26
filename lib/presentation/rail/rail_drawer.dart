part of 'rail_worker.dart';

class RailDrawer extends GetState<RailBloc> with _Worker {
  RailDrawer({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder(
      container: this,
      init: bloc,
      context: context,
      builder: (controller) {
        return SizedBox(
          width:
              context.ismobile ? Sizer.fix_width * 0.6 : Sizer.fix_width * 0.15,
          child: Drawer(
            elevation: 10,
            shadowColor: AppColor.greyField.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white,
            child: _DrawerBody(bloc: bloc),
          ),
        );
      },
    );
  }
}
