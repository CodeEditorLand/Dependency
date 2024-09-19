#!/bin/bash

\pwd

Fn() {
	Owner=$(\git config --get Source.Owner)

	if [ -z "$Owner" ]; then
		Owner=$(\gh repo view --json owner | \jq -r '.owner.login')

		\git config Source.Owner "$Owner"
	fi

	Name=$(\git config --get Source.Name)

	if [ -z "$Name" ]; then
		Name=$(\gh repo view --json name | \jq -r '.name')

		\git config Source.Name "$Name"
	fi

	OwnerParent=$(\git config --get Parent.Owner)

	if [ -z "$OwnerParent" ]; then
		OwnerParent=$(\gh repo view --json parent | \jq -r '.parent.owner.login')

		\git config Parent.Owner "$OwnerParent"
	fi

	NameParent=$(\git config --get Parent.Name)

	if [ -z "$NameParent" ]; then
		NameParent=$(\gh repo view --json parent | \jq -r '.parent.name')

		\git config Parent.Name "$NameParent"
	fi

	BranchParent=$(\git config --get Parent.Branch)

	if [ -z "$BranchParent" ]; then
		BranchParent=$(\gh repo view "$OwnerParent/$NameParent" --json defaultBranchRef | \jq -r '.defaultBranchRef.name')

		\git config Parent.Branch "$BranchParent"
	fi
}

export Fn
export Owner
export Name
export OwnerParent
export NameParent
export BranchParent
