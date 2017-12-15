import generator from "../lib/generator";

describe("Generator", () => {
  test("test data works correctly for generator A", () => {
    let genA = generator(16807, 65, 10, 1);
    expect(genA.next().value).toEqual(43879);
    expect(genA.next().value).toEqual(63289);
    expect(genA.next().value).toEqual(58186);
  });
});
