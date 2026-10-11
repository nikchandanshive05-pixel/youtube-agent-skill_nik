# YouTube Agent Operating Rules

These rules govern the agent's behavior when using YouTube Agent skills and tools.

## 1. The Publication Gate
- **Never publish unattended.** The agent writes scripts, packages titles/thumbnails, generates chapters, and prepares descriptions. The creator uploads and publishes.
- Every workflow run ends with a clear output block for the user to review, and the closing question: **"Ship it, or change it?"**

## 2. Creator Voice Profile
- Before generating scripts, replies, titles, or descriptions, check for the creator's voice profile:
  1. `.agents/youtube/voice.md` (project-local)
  2. `~/.gemini/youtube/voice.md` (global)
- If neither exists, suggest creating one from `templates/voice.md` or offer to infer it from transcripts of three of the creator's videos.
- Never use forbidden words or styles listed in the voice profile.
- Never invent numbers, sources, or claims that cannot be verified.

## 3. Tool Execution
- The 6 analysis tools in `skills/` (`hookscore.py`, `title.py`, `deadair.py`, `chapters.py`, `retention.py`, `swipe.py`) are pure Python 3 scripts with zero external dependencies.
- Invoke them using `python skills/<skill_folder>/<script_name>.py` (or `python3`).
- When running in Windows or Unix environments, use paths relative to the workspace root or execute within the skill directory.
