String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) return 'Email is required';
  final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  if (!regex.hasMatch(value.trim())) return 'Enter a valid email';
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) return 'Phone is required';
  final regex = RegExp(r'^\d{10}$');
  if (!regex.hasMatch(value.trim())) return 'Enter a valid 10-digit phone number';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Password is required';
  if (value.length < 6) return 'Password must be at least 6 characters';
  return null;
}

String? validateRequired(String? value, {String field = 'Field'}) {
  if (value == null || value.trim().isEmpty) return '$field is required';
  return null;
}
