import { onRequest } from "firebase-functions/v2/https";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization",
};

export const places_autocomplete = onRequest({ region: "us-central1" }, async (req, res) => {
  if (req.method === "OPTIONS") {
    res.set(corsHeaders).status(204).send("");
    return;
  }
  try {
    res.set(corsHeaders);

    const body = req.method === "POST" ? (req.body || {}) : req.query || {};
    const q = (body.q || body.query || "").toString();
    if (!q || q.length < 2) {
      res.status(200).json({ predictions: [] });
      return;
    }
    const language = (body.language || "es").toString();
    const components = (body.country ? `country:${body.country}` : "");
    const sessiontoken = (body.sessionToken || "").toString();

    const apiKey = process.env.PLACES_API_KEY;
    if (!apiKey) {
      res.status(500).json({ error: "Missing PLACES_API_KEY" });
      return;
    }

    const params = new URLSearchParams({ input: q, language, key: apiKey });
    if (components) params.append("components", components);
    if (sessiontoken) params.append("sessiontoken", sessiontoken);

    const url = `https://maps.googleapis.com/maps/api/place/autocomplete/json?${params.toString()}`;
    const r = await fetch(url);
    const data = await r.json();

    const predictions = (data.predictions || []).map((p: any) => ({
      description: p.description,
      place_id: p.place_id,
      types: p.types,
    }));

    res.status(200).json({ predictions });
  } catch (e: any) {
    console.error("places_autocomplete error", e);
    res.status(500).json({ error: e?.message || "Unknown error" });
  }
});
