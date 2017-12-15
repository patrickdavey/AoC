import generator from "../lib/generator";

describe("Generator", () => {
  test("test data works correctly for generator A", () => {
    let genA = generator(16807, 65, 10, 1);
    expect(genA.next().value).toEqual("1010101101100111")
    expect(genA.next().value).toEqual("01000110011001001111011100111001".slice(16))
    expect(genA.next().value).toEqual("00001110101000101110001101001010".slice(16))
  });

  test("part 2 passes tests cases", () => {
  });
});
