extension CompareWithoutCaseAndSpace on String? {
  bool compareWithoutCaseAndSpace(String? other) {
    if (other == null) {
      return false;
    }

    return this?.toLowerCase().replaceAll(' ', '') ==
        other.toLowerCase().replaceAll(
              ' ',
              '',
            );
  }
}
