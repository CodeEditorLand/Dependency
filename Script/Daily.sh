#!/bin/bash

\echo "Process: Daily.sh"

# Context: CodeEditorLand/Environment/Stream

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && \pwd)

# "$Directory"/Cache/Get.sh

# "$Directory"/Clone/Repository.sh
# "$Directory"/Module/Git.sh

# "$Directory"/Configure/Repository.sh
# "$Directory"/Setting/Repository.sh
# "$Directory"/Rename/Repository.sh
# "$Directory"/Rename/Branch.sh

# "$Directory"/Sync/Repository.sh
# "$Directory"/Reset/Repository.sh
"$Directory"/Switch/Branch/Repository.sh
"$Directory"/Switch/Branch/Stream.sh

# "$Directory"/Clean/Repository.sh
# "$Directory"/Clean/Detail.sh
# "$Directory"/Move/license.sh
# "$Directory"/Move/package.sh
# "$Directory"/Move/src.sh
# "$Directory"/Append/Detail.sh
# "$Directory"/Sort/Detail.sh

# Maintain Workflow
