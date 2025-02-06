extractErrorMessage(Object e) {
  var string = e.toString();
  return string.contains('Exception: ')
      ? string.replaceFirst('Exception: ', '')
      : string;
}
