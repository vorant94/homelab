import type { Page } from "playwright";
import { env } from "./env.js";

export async function login(page: Page): Promise<void> {
	await page.getByPlaceholder("Username").fill(env.ROUTER_USERNAME);

	await page.getByPlaceholder("Password").fill(env.ROUTER_PASSWORD);

	await page
		.locator("#login_filed")
		.getByText("Sign In", { exact: true })
		.click();
}
