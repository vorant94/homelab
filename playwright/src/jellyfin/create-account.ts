import { usingPage } from "../shared/using-page.js";
import { env } from "./shared/env.js";

await usingPage(async (page) => {
  await page.goto("https://jellyfin.pi.lan/");

  await page.getByRole("button", { name: "Next" }).click();

  await page.getByLabel("Username").fill(env.JELLYFIN_USERNAME);
  await page
    .getByLabel("Password", { exact: true })
    .fill(env.JELLYFIN_PASSWORD);
  await page.getByLabel("Password (confirm)").fill(env.JELLYFIN_PASSWORD);
  await page.getByRole("button", { name: "Next" }).click();

  await page.getByText("Add Media Library").click();
  await page.getByLabel("Content type").selectOption("mixed");
  await page.getByLabel("Display name", { exact: true }).click();
  await page.getByLabel("Display name", { exact: true }).fill("media");
  await page.getByRole("heading", { name: "Folders" }).click();
  await page.getByRole("button", { name: "Add" }).click();
  await page.getByText("/data/media").click();
  await page.locator("button").filter({ hasText: /^Ok$/ }).click();

  await page.getByLabel("Preferred download language").selectOption("ru");
  await page.getByLabel("Country/Region").selectOption("IL");
  await page.getByRole("button", { name: "Ok" }).click();
  await page.getByRole("button", { name: "Next" }).click();

  await page.getByLabel("Language").selectOption("ru");
  await page.getByLabel("Country/Region").selectOption("IL");
  await page.getByRole("button", { name: "Next" }).click();
  await page.getByRole("button", { name: "Next" }).click();
  await page.getByRole("button", { name: "Finish" }).click();
});
