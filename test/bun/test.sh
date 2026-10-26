#!/bin/bash
set -e

# Optional import of the starter kit's colorized testing utilities
source dev-container-features-test-lib

echo "Running feature verification checks..."

# Assert 1: Is the 'bun' executable command available on the path?
check "command presence" bun --version

# Assert 2: Can bun run a basic JS runtime evaluation?
check "runtime computation evaluation" bun -e "console.log('Starter kit assertion passed!')"

# Summarize results back to stdout
reportResults
