import { parseArgs } from "node:util";
import { z } from "zod";

const rawArgs = parseArgs({
	options: {
		file: {
			type: "string",
			short: "f",
		},
	},
});

const argsSchema = z.object({ file: z.string() });

export const importArgs = argsSchema.parse(rawArgs.values);
