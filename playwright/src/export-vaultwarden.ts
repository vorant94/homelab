import path from "node:path";
import process from "node:process";
import { chromium, devices } from "playwright";
import { z } from "zod";

const env = z
	.object({
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		VAULTWARDEN_USERNAME: z.string(),
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		VAULTWARDEN_PASSWORD: z.string(),
	})
	.parse(process.env);

const browser = await chromium.launch();
const context = await browser.newContext(devices["Desktop Chrome"]);
const page = await context.newPage();

await page.goto("https://vaultwarden.pi.lan/");
await page
	.getByLabel("Email Address (required)")
	.fill(env.VAULTWARDEN_USERNAME);
await page
	.getByLabel("Master Password (required)")
	.fill(env.VAULTWARDEN_PASSWORD);
await page.getByRole("button", { name: " Log In" }).click();
await page.getByRole("link", { name: "Tools" }).click();
await page.getByRole("link", { name: "Export Vault" }).click();
await page.getByRole("button", { name: "Confirm Format" }).click();
await page.getByLabel("Master Password").fill(env.VAULTWARDEN_PASSWORD);

const [download] = await Promise.all([
	page.waitForEvent("download"),
	page.getByRole("button", { name: "Export Vault" }).click(),
]);
await download.saveAs(
	path.resolve(process.cwd(), "data", download.suggestedFilename()),
);

await context.close();
await browser.close();
