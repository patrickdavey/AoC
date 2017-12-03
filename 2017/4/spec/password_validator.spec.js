import { valid, validForAnagrams } from "../lib/password_validator";

describe("valid", () => {
  test("sample inputs are correct", () => {
    expect(valid("aa bb cc dd ee ")).toBeTruthy();
    expect(valid("aa bb cc dd aa ")).not.toBeTruthy();
    expect(valid("aa bb cc dd aaa ")).toBeTruthy();
  });

  test("sample anagram inputs are correct", () => {
    expect(validForAnagrams("abcde fghij")).toBeTruthy();
    expect(validForAnagrams("abcde xyz ecdab ")).not.toBeTruthy();
  });
});
