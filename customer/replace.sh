#!/bin/bash -x

find /proj/murex/mx -type f \( \
-name '*.sh' -o \
-name '*.cmd' -o \
-name '*.mxres' -o \
-name '*.xml' -o \
-name '*.jnlp' \) \
-exec sed -i -e "s/MUREXHOSTNAME/mx-server/g; s/MUREXDB_HOST/mx-database/g; s/MUREXDB_PORT/1521/g; s/MUREXDB_SERVER/DB1MXDB/g; s/MUREXDB_DB/appadmin/g; s/ENVIRONMENT_NAME/${Branch}/g;" '{}' ';'
