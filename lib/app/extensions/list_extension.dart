extension ListUtils<T> on List<T> {
  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (var item in this) {
      sum += f(item);
    }
    return sum;
  }

  double sumByDouble(double Function(T element) f) {
    double sum = 0.0;
    for (var item in this) {
      sum += f(item);
    }
    return sum;
  }
}
