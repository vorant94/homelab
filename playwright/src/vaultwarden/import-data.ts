import path from "node:path";
import process from "node:process";
import { importDataArgs } from "../shared/import-data-args.js";
import { usingPage } from "../shared/using-page.js";
import { waitFor } from "../shared/wait-for.js";
import { login } from "./shared/login.js";

await usingPage(async (page) => {
	await page.goto("https://vaultwarden.pi.lan/");
	await login(page);

	await page.getByLabel("Tools", { exact: true }).click();
	await page.getByLabel("Import data").click();

	await page.getByLabel("File format (required)").click();
	await page.getByText("Bitwarden (json)").click();
	const [fileChooser] = await Promise.all([
		page.waitForEvent("filechooser"),
		page.getByRole("button", { name: "Choose File" }).click(),
	]);
	const filePathToImport = path.join(process.cwd(), importDataArgs.file);
	await fileChooser.setFiles(filePathToImport);

	await page.getByRole("button", { name: "Import data" }).click();

	await waitFor(async () => {
		return await page.getByText("Data successfully imported").isVisible();
	});
});
