App::sciolist - Multi-backend password/key management utility

Configuration is stored in a SQLite database in $HOME.

sciolist agent ?FLAGS?
         agent -s
         agent -c

sciolist key ?FLAGS?
         key add --protocol=PROTOCOL ?--key0=value0? ... ?--_private0=private_value0? ...
         key create --protocol=PROTOCOL ?--key0=value0? ...
         key deprecate --key0=value0
         key fetch
         key update

sciolist source ?FLAGS?
         source add
         source deprecate
         source adjust-priority ?--raise? ?--lower?