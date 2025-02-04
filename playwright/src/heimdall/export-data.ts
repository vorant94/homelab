import path from "node:path";
import process from "node:process";
import { usingPage } from "../shared/using-page.js";

await usingPage(async (page) => {
  await page.goto("https://pi.lan/");

  await page.getByRole("link", { name: "Settings" }).click();

  const [download] = await Promise.all([
    page.waitForEvent("download"),
    page.getByRole("link", { name: "export" }).click(),
  ]);

  await download.saveAs(
    path.resolve(process.cwd(), "data", download.suggestedFilename()),
  );
});
