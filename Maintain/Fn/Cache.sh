#!/usr/bin/env bash

\pwd

Fn() {
	Owner=$(\git config --get Source.Owner)

	if [ -z "$Owner" ] || [ "$Owner" = "null" ]; then
		Owner=$(\gh repo view --json owner | \jq -r '.owner.login')

		if [ -n "$Owner" ] && [ "$Owner" != "null" ]; then
			\git config Source.Owner "$Owner"
		else
			echo "Could not determine Source.Owner"
			Owner=""
		fi
	fi

	Name=$(\git config --get Source.Name)

	if [ -z "$Name" ] || [ "$Name" = "null" ]; then
		Name=$(\gh repo view --json name | \jq -r '.name')

		if [ -n "$Name" ] && [ "$Name" != "null" ]; then
			\git config Source.Name "$Name"
		else
			echo "Could not determine Source.Name"
			Name=""
		fi
	fi

	OwnerParent=$(\git config --get Parent.Owner)

	if [ -z "$OwnerParent" ] || [ "$OwnerParent" = "null" ]; then
		OwnerParent=$(\gh repo view --json parent | \jq -r '.parent.owner.login')

		if [ -n "$OwnerParent" ] && [ "$OwnerParent" != "null" ]; then
			\git config Parent.Owner "$OwnerParent"
		else
			echo "Could not determine Parent.Owner (repo might not be a fork)."
			OwnerParent=""
		fi
	fi

	NameParent=$(\git config --get Parent.Name)

	if [ -z "$NameParent" ] || [ "$NameParent" = "null" ]; then
		NameParent=$(\gh repo view --json parent | \jq -r '.parent.name')

		if [ -n "$NameParent" ] && [ "$NameParent" != "null" ]; then
			\git config Parent.Name "$NameParent"
		else
			echo "Could not determine Parent.Name (repo might not be a fork)."
			NameParent=""
		fi
	fi

	BranchParent=""

	BranchParentOverride=$(\git config --get Parent.BranchOverride)

	if [ -n "$BranchParentOverride" ] && [ "$BranchParentOverride" != "null" ]; then
		BranchParent="$BranchParentOverride"

		echo "Using override Parent.BranchOverride: $BranchParent"
	else
		BranchParent=$(\git config --get Parent.Branch)

		if [ -z "$BranchParent" ] || [ "$BranchParent" = "null" ]; then
			if [ -n "$OwnerParent" ] && [ "$OwnerParent" != "null" ] &&
				[ -n "$NameParent" ] && [ "$NameParent" != "null" ]; then
				echo "Attempting to fetch default branch for parent $OwnerParent/$NameParent..."
				BranchParentFetched=$(\gh repo view "$OwnerParent/$NameParent" --json defaultBranchRef | \jq -r '.defaultBranchRef.name' 2>/dev/null) # Suppress gh/jq errors if needed

				if [ -n "$BranchParentFetched" ] && [ "$BranchParentFetched" != "null" ]; then
					BranchParent="$BranchParentFetched"

					\git config Parent.Branch "$BranchParent"

					echo "Fetched and set Parent.Branch: $BranchParent"
				else
					echo "Could not fetch default branch for parent $OwnerParent/$NameParent."
				fi
			else
				echo "Cannot fetch Parent.Branch: Parent Owner/Name not available."
			fi
		else
			echo "Using existing Parent.Branch config: $BranchParent"
		fi
	fi

	export Owner
	export Name
	export OwnerParent
	export NameParent
	export BranchParent
}

export Fn
