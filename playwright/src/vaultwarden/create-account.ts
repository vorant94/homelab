import { usingPage } from "../shared/using-page.js";
import { waitFor } from "../shared/wait-for.js";
import { env } from "./shared/env.js";

await usingPage(async (page) => {
	await page.goto("https://vaultwarden.pi.lan/");

	await page.getByRole("link", { name: "Create account" }).click();

	await page
		.getByLabel("Email address (required)")
		.fill(env.VAULTWARDEN_USERNAME);
	await page.getByLabel("Name").fill(getName());
	await page
		.getByLabel("Master password (required)", { exact: true })
		.fill(env.VAULTWARDEN_PASSWORD);
	await page
		.getByLabel("Re-type master password (")
		.fill(env.VAULTWARDEN_PASSWORD);
	await page.locator("#checkForBreaches").uncheck();

	await page.getByRole("button", { name: "Create account" }).click();

	await waitFor(async () => {
		return await page
			.getByText("Your new account has been created! You may now log in.")
			.isVisible();
	});
});

function getName(): string {
	return env.VAULTWARDEN_USERNAME.split("@")[0] as string;
}
