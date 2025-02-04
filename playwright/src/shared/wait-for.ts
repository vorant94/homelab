import { setTimeout } from "node:timers/promises";

export async function waitFor(callback: () => Promise<boolean>): Promise<void> {
  let isFinished = false;

  while (!isFinished) {
    await setTimeout(1000);
    isFinished = await callback();
  }
}
