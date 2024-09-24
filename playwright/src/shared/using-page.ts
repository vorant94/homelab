import process from "node:process";
import { type LaunchOptions, type Page, chromium, devices } from "playwright";
import { z } from "zod";

const env = z
	.object({
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		DEBUG: z.boolean().default(false),
	})
	.parse(process.env);

export async function usingPage<T>(
	callback: (page: Page) => Promise<T>,
): Promise<T> {
	const options: LaunchOptions = env.DEBUG
		? { headless: false, slowMo: 1000 }
		: {};

	const browser = await chromium.launch(options);
	const context = await browser.newContext(devices["Desktop Chrome"]);
	const page = await context.newPage();

	const result = await callback(page);

	await context.close();
	await browser.close();

	return result;
}
