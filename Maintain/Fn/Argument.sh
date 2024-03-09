#!/bin/bash

Fn() {
	if [ $# -gt 0 ]; then
		if [ -f "$1" ]; then
			\mapfile -t Organization < <(jq -r '.[]' "$1" | \tr -d '\r')
		else
			\echo "Cannot Organization."
			\exit 1
		fi

		if [ -f "$2" ]; then
			\mapfile -t Service < <(jq -r '.[]' "$2" | \tr -d '\r')
		else
			\echo "Cannot Service."
			\exit 1
		fi

		if [ -n "$3" ]; then
			Foundation=$3
		else
			\echo "Cannot Foundation."
			\exit 1
		fi
	fi
}

export Fn
export Organization
export Service
export Foundation
