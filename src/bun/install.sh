#!/bin/sh
set -e

# 1. Force non-interactive package operations
export DEBIAN_FRONTEND=noninteractive

# 2. Install baseline requirements
apt-get update && apt-get install -y --no-install-recommends curl unzip ca-certificates

# 3. Define the global installation directory for Bun
export BUN_INSTALL="/usr/local/share/bun"

# 4. Pipe the official installer script (it will now install directly to $BUN_INSTALL)
curl -fsSL https://bun.sh/install | bash

# 5. Create symlinks so bun/bunx are universally available on the system PATH
ln -sf /usr/local/share/bun/bin/bun /usr/local/bin/bun
ln -sf /usr/local/share/bun/bin/bun /usr/local/bin/bunx

# 6. Ensure the global install directory is readable/executable by non-root users
chmod -R 755 /usr/local/share/bun

# 7. Clean up the package manager cache to minimize layer size
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "Official installation flow finished successfully!"
echo "=================================================="
