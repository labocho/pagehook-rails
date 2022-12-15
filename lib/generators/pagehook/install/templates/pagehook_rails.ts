// Register event handler
import Pagehook from "pagehook";
document.addEventListener("DOMContentLoaded", Pagehook.handler);

// Require all hooks in ./pagehook
interface RequireHook {
  (fileName: string): object | {default: object};
  keys: () => string[];
}
interface NodeRequireWithContext extends NodeRequire {
  context: (a: string, b: boolean, c: RegExp) => RequireHook;
}

const requireHook = (require as NodeRequireWithContext).context(
  "./pagehook",
  true, // Whether or not to look in subfolders
  /[a-z0-9_]+\.(js|ts)$/u,
);

requireHook.keys().forEach((fileName: string) => {
  requireHook(fileName);
});
