import { getCollection, type CollectionEntry } from "astro:content";

export type Post = CollectionEntry<"blog">;

/** Quantos artigos por página, tanto na home do blog quanto nas páginas de tag. */
export const POSTS_PER_PAGE = 12;

/**
 * Vocabulário de tags em uso. Não é validado pelo schema (tag é string livre),
 * mas serve de referência ao escrever post novo: reaproveitar uma tag existente
 * vale mais que criar uma tag com um artigo só.
 */
export const TAG_VOCABULARY = [
  "taxas",
  "pagamentos",
  "plataformas",
  "autonomia",
  "marketing",
  "tráfego pago",
  "produtos digitais",
  "tutorial",
  "tendências",
] as const;

/** "Tráfego pago" -> "trafego-pago". Usado na URL /blog/tag/<slug>/. */
export function slugifyTag(tag: string): string {
  return tag
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

/** Posts publicados, do mais recente para o mais antigo. */
export async function getSortedPosts(): Promise<Post[]> {
  const posts = await getCollection("blog");
  return posts.sort((a, b) => b.data.pubDate.valueOf() - a.data.pubDate.valueOf());
}

export function getPostTags(post: Post): string[] {
  return post.data.tags ?? [];
}

/**
 * Todas as tags em uso, com contagem e slug, ordenadas por volume de posts.
 * O label devolvido é a primeira grafia encontrada para aquele slug, então
 * "Taxas" e "taxas" em posts diferentes viram uma tag só.
 */
export async function getAllTags(): Promise<{ tag: string; slug: string; count: number }[]> {
  const posts = await getSortedPosts();
  const bySlug = new Map<string, { tag: string; slug: string; count: number }>();

  for (const post of posts) {
    for (const tag of getPostTags(post)) {
      const slug = slugifyTag(tag);
      if (!slug) continue;
      const existing = bySlug.get(slug);
      if (existing) existing.count += 1;
      else bySlug.set(slug, { tag, slug, count: 1 });
    }
  }

  return [...bySlug.values()].sort((a, b) => b.count - a.count || a.tag.localeCompare(b.tag, "pt-BR"));
}

export async function getPostsByTagSlug(tagSlug: string): Promise<Post[]> {
  const posts = await getSortedPosts();
  return posts.filter((post) => getPostTags(post).some((tag) => slugifyTag(tag) === tagSlug));
}

/**
 * Artigos relacionados, ranqueados por número de tags em comum e, no empate,
 * pelo mais recente. Se as tags não rendem o suficiente, completa com os posts
 * mais novos para o bloco nunca aparecer pela metade.
 */
export async function getRelatedPosts(currentSlug: string, limit = 3): Promise<Post[]> {
  const posts = await getSortedPosts();
  const current = posts.find((post) => post.id === currentSlug);
  const currentTags = new Set(current ? getPostTags(current).map(slugifyTag) : []);
  const candidates = posts.filter((post) => post.id !== currentSlug);

  const scored = candidates
    .map((post) => ({
      post,
      shared: getPostTags(post).filter((tag) => currentTags.has(slugifyTag(tag))).length,
    }))
    .filter((entry) => entry.shared > 0)
    .sort((a, b) => b.shared - a.shared || b.post.data.pubDate.valueOf() - a.post.data.pubDate.valueOf())
    .map((entry) => entry.post);

  if (scored.length >= limit) return scored.slice(0, limit);

  const chosen = new Set(scored.map((post) => post.id));
  const filler = candidates.filter((post) => !chosen.has(post.id));
  return [...scored, ...filler].slice(0, limit);
}

/** URLs canônicas de paginação. Página 1 mora na raiz, sem /pagina/1/. */
export function blogPageUrl(page: number): string {
  return page <= 1 ? "/blog/" : `/blog/pagina/${page}/`;
}

export function tagPageUrl(tagSlug: string, page = 1): string {
  return page <= 1 ? `/blog/tag/${tagSlug}/` : `/blog/tag/${tagSlug}/pagina/${page}/`;
}

export function paginate<T>(items: T[], page: number, perPage = POSTS_PER_PAGE) {
  const lastPage = Math.max(1, Math.ceil(items.length / perPage));
  const currentPage = Math.min(Math.max(1, page), lastPage);
  const start = (currentPage - 1) * perPage;
  return {
    items: items.slice(start, start + perPage),
    currentPage,
    lastPage,
    total: items.length,
  };
}
