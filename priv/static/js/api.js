const headers = { 'Content-Type': 'application/json' };

export async function fetchPunches(token) {
  const punches = await window.fetch('/api/punches', { headers });
  return await punches.json()
}

export async function punch() {
  await window.fetch(`/api/punches`, {
    headers,
    method: 'POST',
    body: JSON.stringify({
      user: 'Mato',
    }),
  })
}
