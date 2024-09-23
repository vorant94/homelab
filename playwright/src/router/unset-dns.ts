import { usingPage } from "../shared/using-page.js";
import { login } from "./shared/login.js";

await usingPage(async (page) => {
	await page.goto("http://192.168.50.1/");
	await login(page);

	await page.getByTitle("Advanced_LAN_Content.asp").click();
	await page.getByTitle("Advanced_DHCP_Content.asp").click();
	await page.locator('input[name="dhcp_dns1_x"]').fill("");
	await page.getByRole("button", { name: "Apply" }).click();
	await page.waitForURL("http://router.asus.com/Main_Login.asp", {
		timeout: 60_000,
	});
});
