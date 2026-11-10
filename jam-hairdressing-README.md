# Jam Hairdressing: demo build notes (local only, not deployed)

**Lead:** Jam, 135 Oakbrook Road, Sheffield S11 7EB (Fresha calls the area Hangingwater).
In-person lead, 10 Nov 2026: Aidan's hairdresser is raising it with the manager. Not a deal.
**Hook:** the boss doesn't like the current booking system (Fresha). That came second-hand, so
it isn't written on the landing card. Raise it in person.
**Offer:** £795 one-off (the Business tier: 30% deposit, 70% on completion). Raised from £395 on
10 Nov because it now includes a real booking system and staff area. Aidan said "we can sort price
when it comes to it", so this is a recommendation, not a fixed decision.

## Files
| File | What |
|---|---|
| `jam-hairdressing.html` | Landing card. **This is the link to send.** |
| `jam-hairdressing-index.html` | The demo: home, prices, book, team, visit, staff area, privacy |
| `jam-hairdressing-vs-fresha.html` | Owner-facing cost calculator and an honest feature comparison with Fresha |
| `fonts-jam-hairdressing/` | Archivo + Inter + JetBrains Mono (OFL), copied from agency-site |

Deep links: `#prices`, `#book`, `#team`, `#visit`, `#staff`, `#diary` (opens the staff diary).
v1 (black and white with grid squares) is backed up in the 10 Nov session scratchpad. Aidan didn't like the squares.

## Design (v2, 10 Nov)
- The logo and type stay black and white. The backgrounds are "colour fields": radial gradients of berry (#D6336C), peach, plum and lilac, plus slow-floating orbs and light grain. There's no grid and no blur filters.
- Each service category has its own colour (`CC` in the script), used on the price chips, the basket and the diary blocks.

## Facts used (all from Fresha, checked 10 Nov 2026)
- 5.0 rating from 272 reviews. The six review quotes are real Fresha reviews (first name + initial).
- About text: "fun friendly salon where everyone and anyone is welcome (including your dogs)", "amazing music and coffee".
- 15% NHS/blue light discount, 15% student discount.
- Team: Rachael (Blonde Colour Specialist, 4.8), Tracy (Senior Stylist), Emma (Nail Technician), Reuben (Stylist, 5.0; Aidan said "Ruben"), Steven (Stylist, 5.0), Taylor (Colourist, 5.0), Christian (Not taking new clients, 5.0). Ellen appears in older reviews but isn't on the current team list.
- All 42 services, with prices and durations (`S` array in the script).
- Fresha's own service-description rules, enforced by the booking:
  - a skin test at least 48h before colour
  - colour must have a finish booked with it
  - Christian is existing clients only
  - a pre-perm consultation is suggested before a perm
  - toning is separate from bleach roots
- Salon photos: the 3 images from Jam's Fresha gallery, **hotlinked** from images.fresha.com (not downloaded).

## Fresha pricing used on the comparison page (fresha.com/en-GB/pricing, 10 Nov 2026, ex VAT)
- Team plan: £9.95 per bookable team member per month. For Jam's 7 members that's £83.58/month inc VAT, about £1,003/year.
- New marketplace clients: a 20% one-time fee, minimum £4. Returning clients and own-link bookings are free.
- Texts: 20 free per member per month, then 6p. Card payments: 1.19% + 20p in person. Smart Website add-on: £12.95/month.
- The page also says honestly what Fresha does better: the marketplace, card deposits and no-show fees, and a client app.
- Card fees and text top-ups are deliberately left out of the calculator, because Jam would pay those either way.

## Demo features (all face value, saved in this browser's localStorage)
- **Website side:**
  - live "next free chair" box
  - hair finder (2–3 questions that fill the booking)
  - booking in 4 steps, with the colour rules and staff filtering
  - waitlist when a day is nearly full
  - ticket, "add to calendar" (.ics) and "book again in 6 weeks"
  - "Your bookings": running late, change time, cancel, and a lookup by reference
  - contact form, which saves to the staff inbox
- **Staff area (`#staff`):** a demo sign-in with no password, then these tabs:
  - **Today:** KPIs, up next, week chart, patch tests, who's away
  - **Diary:** colour-coded by service; online bookings show in black; time off is hatched; clashes are outlined in red
  - **Time off:** works for real in the demo. It blocks the stylist on the website and shows how many bookings clash.
  - **Services & prices:** edits update the public price list, with an "Updated by the salon" tag
  - **Opening hours:** the weekly hours plus one-off closures
  - **Clients**
  - **Messages:** questions, waitlist, late and cancel
  - **Settings:** notice period, booking window, Christian new-clients toggle, booking policy text, reminder toggles, reset demo
- localStorage keys: `jam-bookings`, `jam-timeoff`, `jam-prices`, `jam-hours`, `jam-closures`, `jam-msgs`, `jam-settings`.

## Gaps (dashed "Note for Jam" boxes in the demo)
- **Opening days.** Fresha lists Mon–Sun; Aidan said closed Sat/Sun/Mon. The demo uses Tue/Thu 10–5 and Wed/Fri 10–8 (`DEF_HOURS`).
- **Phone 0114 230 1241.** Found on a Fresha listing next to a different house number (213 Oakbrook Rd). Unconfirmed.
- No email address, logo file, team photos or cancellation policy yet.
- Which stylist does which service is a sensible guess (`STAFF[].sk`).
- The "4 new marketplace clients a month" default on the comparison page is our guess. Fresha's reports show the real number, and the owner should check it.

## If they say yes: making it real
- **Back end:** Cloudflare Pages Functions + D1 (free tier), which matches the hosting decision. It needs tables for bookings, staff, time off, services, hours and clients.
- **Logins:** one per stylist, with roles (owner sees everything).
- **Email:** confirmation, day-before reminder, time-off rebook emails, waitlist emails. Use a free-tier sender (e.g. Brevo, 300 a day free). Watch the daily cap: about 40 bookings a day × 2 emails fits.
- **Texts:** optional and pay-as-you-go, at the client's cost.
- **Migration:** import Fresha's client CSV. Run both systems for a few weeks, then cancel Fresha.
- **SEO and AI-SEO** for "hairdressers Sheffield" were left until they say yes (Aidan, 10 Nov). The demo is `noindex`. It already has HairSalon JSON-LD and the h1 brand pattern.
