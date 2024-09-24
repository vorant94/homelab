import path from "node:path";
import process from "node:process";
import { usingPage } from "../shared/using-page.js";
import { env } from "./shared/env.js";
import { login } from "./shared/login.js";

await usingPage(async (page) => {
	await page.goto("https://vaultwarden.pi.lan/");
	await login(page);

	await page.getByLabel("Tools", { exact: true }).click();
	await page.getByLabel("Export vault").click();
	await page.getByRole("button", { name: "Confirm Format" }).click();
	await page
		.getByLabel("Master password (required)")
		.fill(env.VAULTWARDEN_PASSWORD);

	const [download] = await Promise.all([
		page.waitForEvent("download"),
		page.getByRole("button", { name: "Export Vault" }).click(),
	]);

	await download.saveAs(
		path.resolve(process.cwd(), "data", download.suggestedFilename()),
	);
});
