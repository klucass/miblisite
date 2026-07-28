// Fonte única das taxas usadas no simulador completo (/simulador-de-taxas/) e no
// simulador de uma linha da home. Ao corrigir uma taxa, corrija só aqui.

export const BRL = new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" });
export const BRL_CHEIO = new Intl.NumberFormat("pt-BR", {
  style: "currency",
  currency: "BRL",
  maximumFractionDigits: 0,
});
export const PCT = new Intl.NumberFormat("pt-BR", { minimumFractionDigits: 0, maximumFractionDigits: 2 });

/**
 * Taxas de referência dos planos padrão: percentual sobre o preço mais fixo por transação.
 * `card: null` significa que o provedor não processa cartão.
 */
export const REFERENCE = {
  platforms: [
    { id: "hotmart", name: "Hotmart", pix: { pct: 9.9, fixed: 1 }, card: { pct: 9.9, fixed: 1 } },
    { id: "kiwify", name: "Kiwify", pix: { pct: 8.99, fixed: 2.49 }, card: { pct: 8.99, fixed: 2.49 } },
    { id: "eduzz", name: "Eduzz", pix: { pct: 4.9, fixed: 2.49 }, card: { pct: 4.9, fixed: 2.49 } },
    { id: "monetizze", name: "Monetizze", pix: { pct: 7.9, fixed: 1.5 }, card: { pct: 7.9, fixed: 1.5 } },
  ],
  miblify: { pix: { pct: 2, fixed: 0 }, card: { pct: 2, fixed: 0 } },
  gateways: {
    mercado_pago: { name: "Mercado Pago", pix: { pct: 0.99, fixed: 0 }, card: { pct: 3.99, fixed: 0 } },
    pague_dev: { name: "Pague.dev", pix: { pct: 0, fixed: 0.8 }, card: null },
    custom: { name: "Outro gateway", pix: { pct: 1, fixed: 0 }, card: { pct: 4.5, fixed: 0 } },
  },
};

/** Custo de uma venda. Nunca passa do próprio preço, para o fixo não gerar líquido negativo. */
export const feeFor = (rate, price) => Math.min(price, (price * rate.pct) / 100 + rate.fixed);

/** "0,99%", "R$ 0,80" ou "0,99% + R$ 0,80", conforme a taxa tenha percentual, fixo ou os dois. */
export const rateLabel = ({ pct, fixed }) =>
  [pct > 0 || !fixed ? `${PCT.format(pct)}%` : null, fixed > 0 ? BRL.format(fixed) : null]
    .filter(Boolean)
    .join(" + ");

/** Na Miblify o custo é a taxa da plataforma somada à do gateway, que o vendedor paga direto. */
export const miblifyRate = (rates, method, gateway = "mercado_pago") => {
  const own = rates.miblify[method];
  const gw = rates.gateways[gateway][method] ?? rates.gateways.mercado_pago[method];
  return { pct: own.pct + gw.pct, fixed: own.fixed + gw.fixed };
};

/** A plataforma tradicional que mais cobra no método, usada para dimensionar a economia máxima. */
export const worstPlatform = (rates, method, price) =>
  rates.platforms.reduce((worst, p) => (feeFor(p[method], price) > feeFor(worst[method], price) ? p : worst));
