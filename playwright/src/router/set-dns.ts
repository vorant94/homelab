import { usingPage } from "../shared/using-page.js";
import { env } from "./shared/env.js";
import { login } from "./shared/login.js";

await usingPage(async (page) => {
  await page.goto("http://router.asus.com");
  await login(page);

  await page.getByTitle("Advanced_LAN_Content.asp").click();
  await page.getByTitle("Advanced_DHCP_Content.asp").click();
  await page.locator('input[name="dhcp_dns1_x"]').fill(env.ROUTER_DNS_IP);
  await page.getByRole("button", { name: "Apply" }).click();
  await page.waitForURL("http://router.asus.com/Main_Login.asp", {
    timeout: 60_000,
  });
});
