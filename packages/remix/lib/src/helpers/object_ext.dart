extension ObjectExtension on Object {
  T? cast<T>() {
    return this is T ? this as T : null;
  }
}
