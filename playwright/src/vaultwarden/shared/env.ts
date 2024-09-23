import process from "node:process";
import { z } from "zod";

export const env = z
	.object({
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		VAULTWARDEN_USERNAME: z.string(),
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		VAULTWARDEN_PASSWORD: z.string(),
	})
	.parse(process.env);
