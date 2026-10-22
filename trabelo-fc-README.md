# Trabelo FC: the club website demo (rebuilt 22 Oct 2026)

One link shows all three packages. The club finds itself, and every page changes to its name,
colours and crest. Local notes only: `*README.md` is in `.vercelignore`.

## Files to upload (these four, nothing else)

| File | What it is |
|---|---|
| `trabelo-fc.html` | The whole demo (replaces the September version; backup is in the session scratchpad) |
| `trabelo-fc-clubs.json` | 2,605 clubs, **public facts only**: name, league, division, step, ground, kit colours (from Wikipedia) |
| `fonts-trabelo-fc/inter-latin.woff2` | The font |
| `vercel.json` | Updated security rule for `/trabelo*` (allows the self-hosted font, the club list and the enquiry form) |

`_headers` is the Netlify copy of the same rules. Upload it too; Vercel ignores it.

## The link

`https://trabelo-tau.vercel.app/trabelo-fc.html` is the chooser page.
`...trabelo-fc.html?club=Albion%20Sports` is personalised: it finds the club, applies its
colours, ground and real division rivals, and shows "This preview was set up for Albion Sports".
The tracker's **Their preview** button and `{demo}` message token build these links for you.

Optional: `&c1=ffd700&c2=000000` forces colours, and `&t=plus` opens on a package.

## What's in it

- **Chooser:** club search ("alb" finds Albion Sports), colour pickers, three package cards with
  payment terms, a Google result illustration, and a note from you
- **Personalise:** search over 2,600 clubs, real kit colours for about 1,000 of them, a crest made
  from initials, badge upload (stays on their device, never uploaded), and a share link for the committee
- **Core (5 pages):** Home with next match countdown, last result, mini table, notices and sponsor
  strip; Fixtures/Results/Table with home/away filter and add-to-calendar; Squad with position
  filter; Club & Matchday with map link, prices, parking, bar, accessibility and away fans;
  Contact with routed form and committee including the welfare officer
- **Plus (8 pages):** Sponsors with packages, wall and a printable sponsor pack; Pitch Fundraiser
  with 100 clickable squares, total raised and supporters wall; Shop with shirts and merch drawn
  in the club's colours
- **Pro (12 pages):** Programme flipbook with sponsor ads and an archive; Membership tiers; News
  with categories and article pages; History timeline and honours; calendar subscribe; player profiles
- **Locked pages** on lower packages show what the page does and a "See it on Plus/Pro" button
- **How it works page:** the 8 steps (who does what), side-by-side comparison, what you need from
  them, what's not included, after-launch prices and FAQs
- **Ask Aidan:** name, role, club, package, wanted features, "has spending been discussed?", and
  a message. Sends by email (or WhatsApp). Includes their chosen colours

## Honesty built in

Every page says the fixtures, players and news are examples. No live scores, no lotteries, no
Google ranking promises, no login areas. Payments are always "Stripe in the club's name".

## To do

- **Web3Forms key:** create one at web3forms.com with aidan@trabelo.com and paste it into
  `WEB3FORMS_KEY` near the top of the script. Until then, Ask Aidan opens the visitor's email app
  with everything filled in, which works but is one extra step for them.
- **Rebuild the club list** next season: `node football-leads/6-export-demo-clubs.mjs` after
  rerunning the lead pipeline.
