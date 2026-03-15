// @ts-check
import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";
import sitemap from "@astrojs/sitemap";
import starlight from "@astrojs/starlight";

// https://astro.build/config
export default defineConfig({
  build: {
    inlineStylesheets: "always",
  },
  vite: {
    plugins: [tailwindcss()],
  },

  site: "https://www.miblify.com",
  integrations: [
    starlight({
      title: "Miblify Help",
      logo: {
        src: "./src/assets/miblify_logo.png",
        replacesTitle: true,
      },
      disable404Route: true,
      defaultLocale: "root",
      locales: {
        root: {
          label: "Português",
          lang: "pt-BR",
        },
      },
      sidebar: [
        {
          label: "Começando",
          autogenerate: { directory: "help/getting-started" },
        },
        {
          label: "Produtos",
          autogenerate: { directory: "help/products" },
        },
        {
          label: "Pagamentos",
          autogenerate: { directory: "help/payments" },
        },
        {
          label: "Vendas",
          autogenerate: { directory: "help/sales" },
        },
        {
          label: "Integrações",
          autogenerate: { directory: "help/integrations" },
        },
        {
          label: "Administração",
          autogenerate: { directory: "help/admin" },
        },
        {
          label: "Suporte",
          autogenerate: { directory: "help/support" },
        },
      ],
      components: {
        ThemeProvider: "./src/components/starlight/ThemeProvider.astro",
        ThemeSelect: "./src/components/starlight/ThemeSelect.astro",
      },
      customCss: ["./src/styles/starlight-custom.css"],
      social: [
        {
          icon: "email",
          label: "E-mail",
          href: "mailto:contato@miblify.com",
        },
      ],
      head: [
        {
          tag: "link",
          attrs: {
            rel: "preload",
            href: "/fonts/cgrotesk.woff2",
            as: "font",
            type: "font/woff2",
            crossorigin: "",
          },
        },
        {
          tag: "link",
          attrs: {
            rel: "preload",
            href: "/fonts/cgroteskBold.woff2",
            as: "font",
            type: "font/woff2",
            crossorigin: "",
          },
        },
        {
          tag: "script",
          attrs: {
            src: "https://rybbit.klucas.dev/api/script.js",
            "data-site-id": "2",
            defer: true,
          },
        },
      ],
    }),
    sitemap(),
  ],
});
