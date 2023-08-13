import 'package:lose_it_up_app/features/authentication/presentation/sign_in/string_validators.dart';

mixin SignInValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passworRegisterSubmitValidator = MinLengthStringValidator(8);
  final StringValidator passworSignInSubmitValidator = NonEmptyStringValidator();

  bool canSubmit(String email) {
    return emailSubmitValidator.isValid(email);
  }
}
