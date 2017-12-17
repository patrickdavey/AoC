import spinlock from "../lib/spinlock";

describe("Spinlock", () => {
  test("test data is correct", () => {
    let spinner = spinlock(3);
    let nextValue = spinner.next().value;
    expect(nextValue.position).toEqual(1);
    expect(nextValue.memory).toEqual([0, 1]);

    nextValue = spinner.next().value;
    expect(nextValue.position).toEqual(1);
    expect(nextValue.memory).toEqual([0, 2, 1]);

    nextValue = spinner.next().value;
    expect(nextValue.position).toEqual(2);
    expect(nextValue.memory).toEqual([0, 2, 3, 1]);
  });
});
