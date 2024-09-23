import process from "node:process";
import { z } from "zod";

export const env = z
	.object({
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		ROUTER_USERNAME: z.string(),
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		ROUTER_PASSWORD: z.string(),
		// biome-ignore lint/style/useNamingConvention: env variables have different convention
		ROUTER_DNS_IP: z.string(),
	})
	.parse(process.env);
