import { indexOf } from "lodash";
import { trim } from "./utils";

function clean(string) {
  const indexOfNextCancel = indexOf(string, "!");
  if (indexOfNextCancel === -1) { return string; }
  // mutate string to remove cancels
  let newString = [...string]
  newString[indexOfNextCancel] = "|";
  newString[indexOfNextCancel + 1] = "|";
  return clean(newString.join(""));
}

export const removeCancels = (string) => {
  const indexOfNextCancel = indexOf(string, "!");
  if (indexOfNextCancel === -1) { return string; }
  // mutate string to remove cancels
  let newString = [...string]
  newString.splice(indexOfNextCancel, 2)
  return removeCancels(newString.join(""));
};

function cleanGarbage(string) {
  const indexOfNextStartingGarbage = indexOf(string, "<");
  if (indexOfNextStartingGarbage === -1) { return string; }

  const indexOfNextFinishingGarbage = indexOf(string, ">", indexOfNextStartingGarbage);
  if (indexOfNextFinishingGarbage === -1) { throw "missing termination garbage" }

  const deleteCount = indexOfNextFinishingGarbage - indexOfNextStartingGarbage + 1;
  // mutate string to remove cancels
  let newString = [...string]
  newString.splice(indexOfNextStartingGarbage, deleteCount)
  return cleanGarbage(newString.join(""));
}

export const countGarbage = (string, count, offset) => {
  const indexOfNextStartingGarbage = indexOf(string, "<", offset);
  if (indexOfNextStartingGarbage === -1) { return count; }

  const indexOfNextFinishingGarbage = indexOf(string, ">", indexOfNextStartingGarbage);
  if (indexOfNextFinishingGarbage === -1) { throw "missing termination garbage" }

  const deleteCount = (indexOfNextFinishingGarbage) - (indexOfNextStartingGarbage + 1);
  // mutate string to remove cancels
  const newOffset = indexOfNextFinishingGarbage + 1;
  return countGarbage(string, count + deleteCount, newOffset);
};

export const tidyCancel = s => clean(s);
export const removeGarbage = s => cleanGarbage(s);
