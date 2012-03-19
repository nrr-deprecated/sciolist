# App::sciolist

A multi-backend password/key management utility half-inspired by Plan 9's `factotum` and `secstore`

Configuration is stored in a SQLite database at `~/.sciolist/config`.

	sciolist agent ?FLAGS?
		 agent -s
		 agent --bourne-shell
		 agent -c
		 agent --c-shell

	sciolist key ?FLAGS?
		 key add --class=CLASS ?--key0=value0? ... ?--+private0=private_value0? ...
		 key create --class=CLASS ?--key0=value0? ...
		 key deprecate --key0=value0
		 key fetch
		 key update

	sciolist source ?FLAGS?
		 source add --source=SOURCE ?--key0=value0? ...
		 source deprecate --source=SOURCE
		 source raise-priority --source=SOURCE
		 source lower-priority --source=SOURCE

	sciolist configuration ?FLAGS?
		 configuration --global ?--key0=value0? ?--key1=value1? ...
		 configuration --source=SOURCE ?--key0=value0? ...
