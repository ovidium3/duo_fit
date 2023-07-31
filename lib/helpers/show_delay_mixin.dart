// Mixin designed to simplify incorporation of delays for widget displays
mixin ShowDelayMixin {
  final int initialDelay = 300;
  final int differenceBetweenDelays = 100;
  int order = 0;

  Duration showDelay() {
    order++;
    return Duration(
      milliseconds: initialDelay + (differenceBetweenDelays * order),
    );
  }
}
