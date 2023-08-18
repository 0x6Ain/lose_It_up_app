import 'package:lose_it_up_app/features/authentication/presentation/sign_in/string_validators.dart';
import 'package:lose_it_up_app/localization/string_hardcoded.dart';

mixin SignInValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordSignInSubmitValidator = MinLengthStringValidator(8);

  bool canSubmit(String email, String password) {
    return canSubmitEmail(email) && canSubmitPassword(password);
  }

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return passwordSignInSubmitValidator.isValid(password);
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText =
        email.isEmpty ? 'Email can\'t be empty'.hardcoded : 'Invalid email'.hardcoded;
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    final bool showErrorText = !canSubmitPassword(password);
    final String errorText =
        password.isEmpty ? 'Password can\'t be empty'.hardcoded : 'Password is too short'.hardcoded;
    return showErrorText ? errorText : null;
  }
}
