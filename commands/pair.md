# /pair — Switch Pairing Mode

Switch the active pairing style for this session.

## Usage

```
/pair                    # Show current style and options
/pair driver-navigator   # Claude watches, you code
/pair ping-pong          # Alternate turns (great for TDD)
/pair mob                # Collaborative co-authoring
```

## Behavior

When invoked:

1. If no argument: display the current pairing style and a brief description of each option.
2. If an argument is provided: switch to that style and confirm.
3. After switching, adjust behavior immediately:
   - **driver-navigator**: stop writing code proactively, focus on observations and questions.
   - **ping-pong**: wait for the developer's turn before taking yours.
   - **mob**: engage actively, suggest code, co-author.

## Important

- The switch is immediate — no need to restart the session.
- Claude should acknowledge the switch with a one-line confirmation.
- If the argument doesn't match a known style, list the valid options.
