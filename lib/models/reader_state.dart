class ReaderState {
  const ReaderState({
    this.sceneIndex = 0,
    this.wordIndex = -1,
    this.started = false,
    this.finished = false,
  });

  final int sceneIndex;
  final int wordIndex;
  final bool started;
  final bool finished;

  ReaderState copyWith({
    int? sceneIndex,
    int? wordIndex,
    bool? started,
    bool? finished,
  }) {
    return ReaderState(
      sceneIndex: sceneIndex ?? this.sceneIndex,
      wordIndex: wordIndex ?? this.wordIndex,
      started: started ?? this.started,
      finished: finished ?? this.finished,
    );
  }
}
