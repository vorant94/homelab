import fs from "node:fs/promises";
import path from "node:path";
import process from "node:process";
import { importDataArgs } from "../shared/import-data-args.js";
import { usingPage } from "../shared/using-page.js";
import { waitFor } from "../shared/wait-for.js";

await usingPage(async (page) => {
	await page.goto("https://pi.lan/");

	await page.getByRole("link", { name: "Settings" }).click();
	await page.getByRole("link", { name: "import" }).click();

	const [fileChooser] = await Promise.all([
		page.waitForEvent("filechooser"),
		page.getByRole("textbox").click(),
	]);
	const filePathToImport = path.join(process.cwd(), importDataArgs.file);
	await fileChooser.setFiles(filePathToImport);

	await page.locator("footer").getByRole("button", { name: "import" }).click();

	const stringToImport = await fs.readFile(filePathToImport, {
		encoding: "utf-8",
	});
	const amountOfItemsToImport = (JSON.parse(stringToImport) as Array<unknown>)
		.length;

	await waitFor(async () => {
		const amountOfItemsImported = await page.getByText("Imported").count();
		return amountOfItemsImported === amountOfItemsToImport;
	});
});
