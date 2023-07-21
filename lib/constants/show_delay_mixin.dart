mixin DelayHelperMixin {
  final int initialDelay = 300, differenceBetweenDelays = 100;
  int order = 0;
  Duration getDelayDuration() {
    order++;
    return Duration(
      milliseconds: initialDelay + (differenceBetweenDelays * order),
    );
  }
}
