part of 'login_worker.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  static const page = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginBloc>(
      init: LoginBloc(localUsecase: Get.find(), usecase: Get.find()),
      builder: (bloc) => _LoginBody(),
    );
  }
}

class _LoginBody extends GetState<LoginBloc> with _Worker {
  @override
  void registerStateEffect(BuildContext currentContext) async {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<LoginBloc>(
      init: bloc,
      container: this,
      context: context,
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.mainOrange.withOpacity(0.8),
          body: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: Sizer.fix_height * 0.6,
                width: context.scale(
                  mobile: context.width * 0.8,
                  tablet: context.width * 0.6,
                  desktop: Sizer.fix_width * 0.6,
                ),
                child: Card(
                  elevation: 15,
                  color: AppColor.appGrayBg,
                  surfaceTintColor: AppColor.appGrayBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      OnlyDesktop(child: _Carousel(bloc: bloc)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: _Body(bloc: bloc),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  final LoginBloc bloc;
  const _Body({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Assets.logo.dbroLogoSecondary.image(
                height: 110,
                width: 100,
              ),
              Text(
                "Selamat Datang",
                style: Font.fix(18).bold(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            "Silahkan Masukkan Akun Anda",
            style: Font.fix(11).medium(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 30),
        PrefixBaseInput(
          height: 40,
          controller: bloc.emailCo,
          inputType: TextInputType.emailAddress,
          hint: "Email",
          trailing: (p0) {
            return FieldIconSuffix(
              icon: Icon(
                IconlyLight.profile,
                color: p0,
                size: 17,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        PrefixBaseInput(
          height: 40,
          controller: bloc.passCo,
          inputType: TextInputType.visiblePassword,
          obscure: true,
          hint: "Password",
          onFieldSubmitted: (p0) => bloc.login(),
          trailing: (p0) {
            return FieldIconSuffix(
              icon: Icon(
                IconlyLight.lock,
                color: p0,
                size: 17,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Spacer(),
            Text(
              "Lupa Password?",
              style: Font.fix(13.5).semiBold(
                color: AppColor.mainOrange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(() {
          final state = bloc.loginState.value;
          if (state is LoadingCase) {
            return const Center(child: BaseLoading());
          } else {
            return BaseButton(
              isFillWidth: true,
              title: "Login",
              onPressed: () => bloc.login(),
            );
          }
        }),
      ],
    );
  }
}
