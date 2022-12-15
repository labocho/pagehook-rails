// Register event handler
import Pagehook from "pagehook";
document.addEventListener("DOMContentLoaded", Pagehook.handler);

const requireHook = require.context(
  "./pagehook",
  true, // Whether or not to look in subfolders
  /[a-z0-9_]+\.(js|ts)$/u,
);

requireHook.keys().forEach((fileName) => {
  requireHook(fileName);
});
