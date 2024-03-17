part of 'user_verify_worker.dart';

@RoutePage()
class UserVerifyPage extends StatelessWidget {
  static const page = '/email_registration';
  const UserVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appGrayBg,
      appBar: BaseAppbar(
        title: 'Register Verify',
        showLogout: false,
        menu: [
          Bar(
            title: 'Verify',
            color: AppColor.projectPrimary,
          ),
        ],
      ),
      body: GetBuilder(
        init: UserVerifyBloc(
          registerVerifyUsecase: Get.find(),
        ),
        builder: (_) {
          return _State();
        },
      ),
    );
  }
}

class _State extends GetState<UserVerifyBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<UserVerifyBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
            bottom: 24,
          ),
          child: BaseContainer(
            child: Form(
              key: bloc.formKey,
              onChanged: () {
                final valid = bloc.formKey.currentState?.validate() ?? false;
                bloc.valid(valid);
              },
              child: _Body(bloc: bloc),
            ),
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  final UserVerifyBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Create Password',
          style: Font.fix(18).bold(
            color: AppColor.headerTile,
          ),
        ),
        const SizedBox(height: 15),
        CommonFlexChildren(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFlex(
              child: Obx(() {
                final obscure = bloc.obscureA.value;
                return PrefixBaseInput(
                  labelBgColor: Colors.white,
                  controller: bloc.passCo,
                  obscure: obscure,
                  hint: 'Password',
                  validator: (value) {
                    final str = value ?? '';
                    if (str.isEmpty) {
                      return 'This field cannot be emoty';
                    } else {
                      return null;
                    }
                  },
                  trailing: (color) {
                    return InkWell(
                      onTap: () {
                        if (obscure) {
                          bloc.obscureA(false);
                        } else {
                          bloc.obscureA(true);
                        }
                      },
                      child: FieldIconSuffix(
                        icon: Icon(
                          obscure ? IconlyLight.show : IconlyLight.hide,
                          color: color,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const CommonFlexBox(size: 20),
            CommonFlex(
              child: Obx(() {
                final obscure = bloc.obscureB.value;
                return PrefixBaseInput(
                  labelBgColor: Colors.white,
                  controller: bloc.confirmCo,
                  obscure: obscure,
                  hint: 'Confirm Password',
                  validator: (value) {
                    final str = value ?? '';
                    if (str.isEmpty) {
                      return 'This field cannot be emoty';
                    } else if (bloc.passCo.text != value) {
                      return 'Password not same';
                    } else {
                      return null;
                    }
                  },
                  trailing: (color) {
                    return InkWell(
                      onTap: () {
                        if (obscure) {
                          bloc.obscureB(false);
                        } else {
                          bloc.obscureB(true);
                        }
                      },
                      child: FieldIconSuffix(
                        icon: Icon(
                          obscure ? IconlyLight.show : IconlyLight.hide,
                          color: color,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
        const SizedBox(height: 38),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Obx(() {
              final valid = bloc.valid.value;
              return BaseButtonIcon(
                isFillWidth: false,
                isDisabled: valid == false,
                title: "Submit",
                onPressed: () => bloc.verify(),
              );
            }),
          ],
        ),
      ],
    );
  }
}
