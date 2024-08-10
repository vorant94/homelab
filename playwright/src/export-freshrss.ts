import path from "node:path";
import process from "node:process";
import { chromium, devices } from "playwright";
import { z } from "zod";

const env = z
	.object({
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		FRESHRSS_USERNAME: z.string(),
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		FRESHRSS_PASSWORD: z.string(),
	})
	.parse(process.env);

const browser = await chromium.launch();
const context = await browser.newContext(devices["Desktop Chrome"]);
const page = await context.newPage();

await page.goto("https://freshrss.pi.lan/");
await page.getByLabel("Username").fill(env.FRESHRSS_USERNAME);
await page.getByLabel("Password").fill(env.FRESHRSS_PASSWORD);
await page.getByRole("button", { name: "Login" }).click();
await page.getByRole("link", { name: "Subscription management" }).click();
await page.getByRole("link", { name: "Import / export" }).click();

const [download] = await Promise.all([
	page.waitForEvent("download"),
	page.getByRole("button", { name: "Export" }).click(),
]);
await download.saveAs(
	path.resolve(process.cwd(), "data", download.suggestedFilename()),
);

await context.close();
await browser.close();
