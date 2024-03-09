
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: "0.0.0.0", // Defaults to `localhost`
    port: 3000, // Defaults to `8080`
    https: false, // Create a self-signed certificate for HTTPS or use an existing one (see key and cert options)
  },
});
