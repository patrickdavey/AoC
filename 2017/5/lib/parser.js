const { chain, toDecimal, intoLines } = require("./utils");

module.exports = {
  parse: (raw) => {
    return chain(raw)
      .thru(intoLines)
      .map(toDecimal)
      .value();
  }
};
