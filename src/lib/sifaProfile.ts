import { fetchProfile } from "@singi-labs/sifa-sdk/query/fetchers";

export async function getCv() {
  const profile = await fetchProfile({ baseUrl: "https://sifa.id" }, "beck.eurosky.social");

  profile?.positions.sort((x, y) => Date.parse(y.startedAt) - Date.parse(x.startedAt));
  return profile;
}
