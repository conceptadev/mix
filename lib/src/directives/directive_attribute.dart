abstract class Directive<T> {
  const Directive();
  T modify(covariant T value);
}
