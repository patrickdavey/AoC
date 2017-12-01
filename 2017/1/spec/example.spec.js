import Example from "../lib/example";

describe("Example", () => {
  const example = new Example();

  test("returns 5", () => {
    expect(example.test()).toEqual(5);
  });
});
