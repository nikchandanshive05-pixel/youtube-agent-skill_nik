# The YouTube Agent Skill Pack for Google Antigravity

Eleven Google Antigravity skills that run a YouTube channel. Free, MIT, no signup, no external API keys, zero third-party pip dependencies.

One writes your script off 21 hook formulas and scores the hook before you waste a take on it. One lints the title and thumbnail as a single pairing, eliminating duplicate wording across your click surface. One reads your YouTube Studio audience-retention CSV export and tells you the exact second people left and what you were saying when they did. One turns a transcript into an edit decision list (EDL). One finds the Shorts already hiding inside a long video. One uncovers what is working in your niche and ranks it by how far each video beat its own channel's median, not by channel size.

**Nothing gets published until you do it.** These skills write. You upload.

---

## Installation for Google Antigravity

### Option 1: Automatic Project-Local Use
Clone this repository and open the folder in Antigravity. Antigravity automatically discovers and activates all 11 skills via `.agents/skills.json`:

```bash
git clone https://github.com/nikchandanshive05-pixel/youtube-agent-skill_nik.git
```

### Option 2: One-Click Global Plugin Installation
To make all 11 skills available globally across every project and workspace in Antigravity:

**On Windows (PowerShell):**
```powershell
.\install.ps1
```

**On macOS / Linux:**
```bash
chmod +x install.sh
./install.sh
```

*(Or simply copy or clone this repo directly into `~/.gemini/config/plugins/youtube-agent` and restart Antigravity).*

---

## Setting Up Your Voice Profile (`voice.md`)

Spend ten minutes on [`templates/voice.md`](templates/voice.md). Copy it to:
- **Global**: `~/.gemini/youtube/voice.md`
- **Or Project-local**: `.agents/youtube/voice.md`

Fill it in with your speaking style, words you never use, words you do use, and what you will not claim. Alternatively, paste three of your video transcripts into Antigravity and say: *"write my voice.md from these"*.

Every skill reads this file before writing to ensure scripts, replies, and titles sound authentically like you.

---

## The Eleven Skills

Trigger these skills via slash command or conversational requests in Antigravity:

| Slash Command | What It Does |
| --- | --- |
| `/yt-script` | One idea into a full script. Five hooks off [21 formulas](skills/yt-script/hooks.json), scored, then the spoken script with `[ON SCREEN: ...]` visual beats and runtime estimates. |
| `/yt-package` | Title and thumbnail as one pairing, linted for truncation (mobile 40-char, desktop 60-char), repetition, vagueness, and emphasis. |
| `/yt-edit` | A transcript into an edit decision list (EDL): dead air, filler cues ("um", "basically"), and retakes with timecodes. |
| `/yt-retention` | Reads YouTube Studio retention CSVs: hook leak (<30s), cliffs (steep dips), and pacing slide. |
| `/yt-shorts` | Finds self-contained 20–55s moments inside long videos, writing fresh opening hooks, on-screen text, and loop points. |
| `/yt-viral` | Ranks niche videos by outlier multiple over each channel's median views, identifying proven structural formats. |
| `/yt-plan` | Builds a weekly upload calendar tailored to your actual available hours (1 anchor, 1 cheap video, 3 Shorts). |
| `/yt-seo` | Writes descriptions, chapters, and disambiguation tags aimed at queries real people type. |
| `/yt-chapters` | Chapters from a transcript, validated against YouTube's rendering rules (00:00 start, min 3 chapters, min 10s each). |
| `/yt-comment` | Comment section triage (questions, corrections, praise, bait) and voice-calibrated replies under 30 words. |
| `/yt-audit` | Audits the whole channel down to **ONE** high-impact fix to focus on this week. |

---

## The Six Standalone Python Engines

Every tool runs on clean Python 3 with standard library modules only (zero `pip` packages required):

```bash
# 5-property hook scoring panel (SPECIFICITY, ADDRESS, STAKES, CURIOSITY, BREVITY)
python skills/yt-script/hookscore.py --hook "Why 99% of creators fail before day 30"

# Title + thumbnail pairing linter
python skills/yt-package/title.py --title "I Tested 50 Hooks" --thumb "50 HOOKS TESTED"

# Edit decision list (EDL) from SRT, VTT, or Whisper JSON
python skills/yt-edit/deadair.py transcript.srt

# Validated YouTube chapters
python skills/yt-chapters/chapters.py transcript.srt --target 8

# Audience retention leak report
python skills/yt-retention/retention.py retention.csv --duration 600

# Channel-relative virality outlier ranker
python skills/yt-viral/swipe.py collected.json --min 2.0
```

---

## The Fine Print

- **It does not publish unattended.** Antigravity writes and formats. You upload and hit publish. Every skill output ends in a copyable block and the question: **ship it, or change it?**
- **`hookscore.py` is a heuristic, not a predictor.** Calibrated against 74 short-form hooks to catch weak, vague, or self-answering openings. A low score means look again; a high score is not a guarantee.
- **`swipe.py` reads, it does not scrape.** Operates on public video metadata listings, never requiring your login credentials or session tokens.
- **Tags barely matter.** This pack tells you the truth instead of generating useless walls of tags.
- **Nothing invents numbers.** If a skill needs a figure it does not have, it asks you or writes without it.

---

## License

MIT. Use it, customize it, ship it.
