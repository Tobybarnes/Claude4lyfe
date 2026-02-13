# Sounds 🔊

Audio files for Claude Code status feedback and notifications.

## Collections

### Sims 2 (`sims2/`)
144 character voice files from The Sims 2:
- Happy/Success sounds (FemalePLSHappy, MaleSSSSuccess, etc.)
- Sad/Failure sounds (FemalePLSSad, MaleKLSFailure, etc.)
- Celebration sounds (fCELEB0, mCELEB0, etc.)
- Emotional responses (fHAPPY0, mMAD0, etc.)
- Various character reactions

**Good for:**
- Success notifications
- Error/failure alerts
- Task completion
- Status changes

### SimCity Classic - DOS (`simcity-dos/`)
8 classic DOS-era sound effects:
- CarHorn.wav
- Explosion.wav
- HeliTrafficReport.wav
- Monster.wav
- NoPlop.wav (error sound)
- Plop1.wav, Plop2.wav (placement sounds)
- Siren.wav

**Good for:**
- Build/deployment sounds
- Error notifications (NoPlop)
- Success sounds (Plop)
- Alert sounds (Siren)

### SimCity Classic - Windows (`simcity-windows/`)
18 Windows version sound effects:
- AIRFLYBY.WAV, AIRLAND.WAV, AIRTKOFF.WAV
- COPTER.WAV
- EARTHQ.WAV, TORNADO.WAV, FLOOD.WAV
- EXPLODE.WAV, FIRE.WAV
- MONSTER.WAV
- PLOPOK.WAV (success!)
- PLOPERR.WAV (error!)
- PLOPFUND.WAV, PLOPDOZE.WAV, PLOPZONE.WAV
- SHIP.WAV, TRAIN.WAV
- SIREN.WAV

**Good for:**
- Quick success/error feedback (PLOPOK/PLOPERR)
- Alert sounds (SIREN)
- Background activity (TRAIN, SHIP)
- Dramatic events (MONSTER, EXPLODE)

## Usage with agent-sims-hook.sh

The agent-sims-hook.sh script posts status to localhost:3333. Configure your agent-sims server to play these sounds based on status:

**Suggested mappings:**
- **working** → PLOPOK.WAV, Plop1.wav, or Sims happy sounds
- **thinking** → Sims contemplative sounds, COPTER.WAV
- **offline** → PLOPERR.WAV, NoPlop.wav, or Sims sad sounds
- **success** → FemalePLSSuccess.wav, MaleSSSSuccess.wav, PLOPOK.WAV
- **error** → PLOPERR.WAV, NoPlop.wav, Monster.wav

## Total Files

- **170 sound files** (144 Sims 2 + 8 SimCity DOS + 18 SimCity Windows)
- All WAV format
- Authentic retro game sounds
- Perfect for nostalgic development vibes

## Customization

Feel free to:
- Pick favorite sounds from each collection
- Mix and match for different events
- Create playlists for different moods
- Use shorter sounds for frequent events
- Use dramatic sounds for important events

---

*These sounds are from The Sims 2 and SimCity Classic*
