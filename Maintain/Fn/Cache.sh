#!/usr/bin/env bash

\pwd

Fn() {
	Owner=$(\git config --get Source.Owner)

	if [ -z "$Owner" ] || [ "$Owner" = "null" ]; then
		Owner=$(\gh repo view --json owner | \jq -r '.owner.login')

		if [ -n "$Owner" ] && [ "$Owner" != "null" ]; then
			\git config Source.Owner "$Owner"
		else
			echo "Could not git config Source.Owner"
		fi
	fi

	Name=$(\git config --get Source.Name)

	if [ -z "$Name" ] || [ "$Name" = "null" ]; then
		Name=$(\gh repo view --json name | \jq -r '.name')

		if [ -n "$Name" ] && [ "$Name" != "null" ]; then
			\git config Source.Name "$Name"
		else
			echo "Could not git config Source.Name"
		fi
	fi

	OwnerParent=$(\git config --get Parent.Owner)

	if [ -z "$OwnerParent" ] || [ "$OwnerParent" = "null" ]; then
		OwnerParent=$(\gh repo view --json parent | \jq -r '.parent.owner.login')

		if [ -n "$OwnerParent" ] && [ "$OwnerParent" != "null" ]; then
			\git config Parent.Owner "$OwnerParent"
		else
			echo "Could not git config Parent.Owner"
		fi
	fi

	NameParent=$(\git config --get Parent.Name)

	if [ -z "$NameParent" ] || [ "$NameParent" = "null" ]; then
		NameParent=$(\gh repo view --json parent | \jq -r '.parent.name')

		if [ -n "$NameParent" ] && [ "$NameParent" != "null" ]; then
			\git config Parent.Name "$NameParent"
		else
			echo "Could not git config Parent.Name"
		fi
	fi

	BranchParent=$(\git config --get Parent.Branch)

	if [ -z "$BranchParent" ] || [ "$BranchParent" = "null" ]; then
		BranchParent=$(\gh repo view "$OwnerParent/$NameParent" --json defaultBranchRef | \jq -r '.defaultBranchRef.name')

		if [ -n "$BranchParent" ] && [ "$BranchParent" != "null" ]; then
			\git config Parent.Branch "$BranchParent"
		else
			echo "Could not git config Parent.Branch"
		fi
	fi
}

export Fn

export Owner
export Name
export OwnerParent
export NameParent
export BranchParent
