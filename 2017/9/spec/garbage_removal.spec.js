import { removeGarbage, tidyCancel } from "../lib/tidy_cancel";

describe("tidyCancel", () => {
  test("can tidy up test cancels", () => {
    expect(tidyCancel("<>")).toEqual("<>")
    expect(tidyCancel("<random characters>")).toEqual("<random characters>");
    expect(tidyCancel("<<<<>")).toEqual("<<<<>");
    expect(tidyCancel("<{!>}>")).toEqual("<{||}>");
    expect(tidyCancel("<!!>")).toEqual("<||>");
    expect(tidyCancel("<!!!>>")).toEqual("<||||>");
    expect(tidyCancel('<{o"i!a,<{i<a>')).toEqual('<{o"i||,<{i<a>')
  });

  test("can remove garbage from a string", () => {
    expect(removeGarbage("<>")).toEqual("")
    expect(removeGarbage("<random characters>")).toEqual("")
    expect(removeGarbage("<<<<>")).toEqual("")
    expect(removeGarbage("<{||}>")).toEqual("")
    expect(removeGarbage("<||>")).toEqual("")
    expect(removeGarbage("<||||>")).toEqual("")
    expect(removeGarbage('<{o"i!a,<{i<a>')).toEqual('')
    expect(removeGarbage("{<a>,<a>,<a>,<a>}")).toEqual('{,,,}')
  });
});
