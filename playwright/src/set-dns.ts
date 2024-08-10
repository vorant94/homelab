import process from "node:process";
import { chromium, devices } from "playwright";
import { z } from "zod";

const env = z
	.object({
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		ROUTER_USERNAME: z.string(),
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		ROUTER_PASSWORD: z.string(),
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		ROUTER_DNS_IP: z.string(),
	})
	.parse(process.env);

const browser = await chromium.launch();
const context = await browser.newContext(devices["Desktop Chrome"]);
const page = await context.newPage();

await page.goto("http://router.asus.com");
await page.getByPlaceholder("Username").fill(env.ROUTER_USERNAME);
await page.getByPlaceholder("Password").fill(env.ROUTER_PASSWORD);
await page
	.locator("#login_filed")
	.getByText("Sign In", { exact: true })
	.click();
await page.getByTitle("Advanced_LAN_Content.asp").click();
await page.getByTitle("Advanced_DHCP_Content.asp").click();
await page.locator('input[name="dhcp_dns1_x"]').fill(env.ROUTER_DNS_IP);
await page.getByRole("button", { name: "Apply" }).click();
await page.waitForURL("http://router.asus.com/Main_Login.asp", {
	timeout: 60_000,
});

await context.close();
await browser.close();
