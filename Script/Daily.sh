#!/bin/bash

echo "Process: Daily.sh"

# Context: CodeEditorLand/Application

Directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

"$Directory"/Cache/Get.sh
"$Directory"/Module/Git.sh

"$Directory"/Clone/Repository.sh

"$Directory"/Configure/Repository.sh
"$Directory"/Setting/Repository.sh
"$Directory"/Rename/Repository.sh
"$Directory"/Rename/Branch.sh

"$Directory"/Sync/Repository.sh

"$Directory"/Clean/Repository.sh
"$Directory"/Clean/Detail.sh
"$Directory"/Move/src.sh
"$Directory"/Move/license.sh
"$Directory"/Append/Detail.sh
