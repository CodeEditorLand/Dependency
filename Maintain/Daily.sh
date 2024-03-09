#!/bin/bash

Directory=$(\cd -- "$(\dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && \pwd)

"$Directory"/Cache/Service.sh

# "$Directory"/Clone/Service.sh
# "$Directory"/Module/Foundation.sh

# "$Directory"/Configure/Service.sh
# "$Directory"/Setting/Service.sh
# "$Directory"/Rename/Service.sh

# "$Directory"/Sync/Service.sh
# "$Directory"/Switch/Branch/Previous.sh
# "$Directory"/Reset/Service.sh
# "$Directory"/Switch/Branch/Current.sh
# "$Directory"/Reset/Service.sh

# "$Directory"/Default/Branch/Service.sh

# "$Directory"/Clean/Repository.sh
# "$Directory"/Clean/Detail.sh
# "$Directory"/Move/license.sh
# "$Directory"/Move/package.sh
# "$Directory"/Move/src.sh
# "$Directory"/Append/Detail.sh
# "$Directory"/Sort/Detail.sh

Maintain Workflow

# # biome check "$Directory" --apply-unsafe

"$Directory"/Restore/.gitignore.sh
"$Directory"/Restore/package.json.sh
