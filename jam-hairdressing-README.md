# Jam Hairdressing: demo build notes (local only, not deployed)

**Lead:** Jam, 135 Oakbrook Road, Sheffield S11 7EB (Fresha calls the area Hangingwater).
In-person lead, 10 Nov 2026: Aidan's hairdresser is raising it with the manager. Not a deal.
**Hook:** the boss doesn't like the current booking system (Fresha). That came second-hand, so
it isn't written on the landing card. Raise it in person.
**Offer:** the £395 Starter (no deposit, pay on completion).

## Files
| File | What |
|---|---|
| `jam-hairdressing.html` | Landing card. **This is the link to send.** |
| `jam-hairdressing-index.html` | The demo: home, prices, book, team, visit, diary (salon view), privacy |
| `fonts-jam-hairdressing/` | Archivo + Inter + JetBrains Mono (OFL), copied from agency-site |

Deep links work: `#prices`, `#book`, `#team`, `#visit`, `#diary`.

## Facts used (all from Fresha, checked 10 Nov 2026)
- 5.0 rating from 272 reviews. The six review quotes are real Fresha reviews (first name + initial).
- About text: "fun friendly salon where everyone and anyone is welcome (including your dogs)", "amazing music and coffee".
- 15% NHS/blue light discount, 15% student discount.
- Team: Rachael (Blonde Colour Specialist, 4.8), Tracy (Senior Stylist), Emma (Nail Technician), Reuben (Stylist, 5.0; Aidan said "Ruben"), Steven (Stylist, 5.0), Taylor (Colourist, 5.0), Christian (Not taking new clients, 5.0). Ellen appears in older reviews and in the Beauty description, but not on the current team list, so she's left out.
- All 42 services with prices and durations (`S` array in the script). Fresha says "44 services" because it double-counts featured ones.
- Rules from Fresha's own descriptions, now enforced by the booker: new colour clients need a consultation + skin test ≥48h before; every colour service needs a blast off, blow dry or cut; Christian is not taking new clients; pre-perm consultation advised; toning is separate from bleach roots.
- Salon photos: the 3 images from Jam's Fresha gallery, **hotlinked** from images.fresha.com (not downloaded).

## Gaps (dashed "Note for Jam" boxes in the demo)
- **Opening days.** Fresha lists Mon–Sun (Wed/Fri until 8). Aidan said they're closed Sat/Sun/Mon. The demo uses Tue/Thu 10–5 and Wed/Fri 10–8. Confirm. `HOURS` in the script drives everything.
- **Phone 0114 230 1241.** Found on a Fresha listing page next to a different house number (213 Oakbrook Rd). Unconfirmed.
- No email address, logo file, team photos or cancellation policy. The logo is a typographic "JAM" wordmark for now.
- Which stylist does which service is a sensible guess (`STAFF[].sk`). Confirm with the salon.

## How the booking demo works
- Everything runs in the page. Existing appointments are **seeded sample data** (same every time for a given stylist and day), labelled "sample" in the diary.
- Bookings you make are saved in `localStorage` (`jam-bookings`), block those times, show in "Your bookings" and appear in white in the diary. "Add to calendar" builds an .ics in the browser.
- The contact form shows a demo success message. It doesn't send anything.

## If they say yes: making the booking real
The demo is the front end only. A real version needs a small back end:
- a database of bookings, staff rotas and blocked time
- a staff log-in for the diary
- confirmation emails
Free-tier options: Cloudflare Pages Functions + D1, or Supabase. This is more work than a normal £395 Starter, so decide the price before promising it (see the chat notes from 10 Nov 2026).
Also tell them: leaving Fresha means losing its marketplace listing, where new clients find them and where the 272 reviews live.

SEO and AI-SEO for "hairdressers Sheffield" were deliberately left until they say yes (Aidan, 10 Nov). The demo is `noindex`. It already has HairSalon JSON-LD and the h1 brand pattern from Ellis's build.
