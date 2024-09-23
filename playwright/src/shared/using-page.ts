import { type Page, chromium, devices } from "playwright";

export async function usingPage(
	callback: (page: Page) => Promise<void>,
): Promise<void> {
	const browser = await chromium.launch();
	const context = await browser.newContext(devices["Desktop Chrome"]);
	const page = await context.newPage();

	await callback(page);

	await context.close();
	await browser.close();
}
