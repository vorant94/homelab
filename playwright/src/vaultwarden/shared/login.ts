import type { Page } from "playwright";
import { env } from "./env.js";

export async function login(page: Page): Promise<void> {
  await page
    .getByLabel("Email Address (required)")
    .fill(env.VAULTWARDEN_USERNAME);
  await page.getByRole("button", { name: "Continue" }).click();

  await page
    .getByLabel("Master Password (required)")
    .fill(env.VAULTWARDEN_PASSWORD);
  await page
    .getByRole("button", { name: "Log in with master password" })
    .click();
}
