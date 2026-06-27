Output demos/demo.gif
Set Shell "bash"
Set FontSize 20
Set Width 1280
Set Height 720
Set Theme "Catppuccin Mocha"
Set TypingSpeed 50ms

Type "# GraphTheory · Hermes profiles and agent tooling" Enter
Sleep 600ms

Hide
Type "source demos/vhs/sanitize-recording-env.sh" Enter
Sleep 300ms
Type "gh api users/codegraphtheory/repos --jq '.[]|select(.fork==false)|.name'" Enter
Sleep 4s
Type "sed -n '1,22p' README.md" Enter
Sleep 8s
Show

Type "hermes profile install github.com/codegraphtheory/hermes-profile-template --name profile-architect --alias --yes" Enter
Sleep 4s
Type "# Open source AI advocate · graphtheory.xyz" Enter
Sleep 3s
