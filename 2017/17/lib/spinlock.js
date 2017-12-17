function *spinlock (stepIncrement) {
  let position = 0;
  let memory = [0];
  let i = 1;
  while (true) {
    position = ((position + stepIncrement) % memory.length) + 1;
    memory.splice(position, 0, i);
    yield { position, memory, i };
    i += 1;
  }
}

export default spinlock;
