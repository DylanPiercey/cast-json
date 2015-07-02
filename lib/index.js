/** cast-json v0.0.1 */
var dateReg;

dateReg = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d*)(?:Z|(\+|-)[\d|:]*)?$/;

module.exports = function(key, val) {
  if (typeof val !== "string") {
    return val;
  }
  switch (val) {
    case "":
      return val;
    case "null":
      return null;
    case "undefined":
      return void 0;
    case "true":
    case "yes":
    case "on":
      return true;
    case "false":
    case "no":
    case "off":
      return false;
    default:
      switch (false) {
        case !isFinite(val):
          return Number(val);
        case !dateReg.test(val):
          return new Date(val);
        default:
          return val;
      }
  }
};
