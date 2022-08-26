class Validator {
  String? validateNameEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Заполните поле "Имя"';
    } else {
      return null;
    }
  }
}
