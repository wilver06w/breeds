String format422Errors(errors) {
  var formatedErrors = <String>[];

  errors.forEach((key, value) {
    formatedErrors.add(value[0].toString());
  });

  return formatedErrors.join('\n\n');
}
