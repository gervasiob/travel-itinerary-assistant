import { onRequest } from "firebase-functions/v2/https";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization",
};

export const send_invite_email = onRequest({ region: "us-central1" }, async (req, res) => {
  if (req.method === "OPTIONS") {
    res.set(corsHeaders).status(204).send("");
    return;
  }
  try {
    res.set(corsHeaders);

    const body = req.method === "POST" ? (req.body || {}) : req.query || {};
    const to: string = (body.to || body.email || "").toString();
    const tripName: string = (body.tripName || "Tu viaje").toString();
    const inviterName: string = (body.inviterName || "Un contacto").toString();
    const inviteUrl: string = (body.inviteUrl || "https://viajesapp.app").toString();

    if (!to) {
      res.status(400).json({ error: "Missing 'to' email" });
      return;
    }

    const apiKey = process.env.RESEND_API_KEY;
    const fromEmail = process.env.INVITE_FROM_EMAIL || "noreply@viajesapp.app";

    if (!apiKey) {
      res.status(500).json({ error: "Missing RESEND_API_KEY" });
      return;
    }

    const subject = `${inviterName} te invitó a unirte al viaje: ${tripName}`;
    const html = `
      <div style="font-family:Inter,system-ui,Segoe UI,Arial,sans-serif;line-height:1.6;color:#111">
        <h2>Te invitaron a un viaje ✈️</h2>
        <p><strong>${inviterName}</strong> te invitó a colaborar en <strong>${tripName}</strong>.</p>
        <p>Para aceptar la invitación, crea una cuenta o inicia sesión y abre este enlace:</p>
        <p><a href="${inviteUrl}" target="_blank" style="color:#0b57d0">Abrir el viaje</a></p>
        <hr />
        <p style="font-size:12px;color:#666">Si no esperabas este correo, puedes ignorarlo.</p>
      </div>
    `;

    const r = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${apiKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from: fromEmail,
        to: [to],
        subject,
        html,
      }),
    });

    if (!r.ok) {
      const err = await r.text();
      console.error("Resend error", r.status, err);
      res.status(502).json({ error: "Email provider error", detail: err });
      return;
    }

    const out = await r.json();
    res.status(200).json({ ok: true, id: out?.id });
  } catch (e: any) {
    console.error("send_invite_email error", e);
    res.status(500).json({ error: e?.message || "Unknown error" });
  }
});
