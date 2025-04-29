class IdGenerator {
  int _tempId = -1;
  int gen() {
    return _tempId--;
  }
}