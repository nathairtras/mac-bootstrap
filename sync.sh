echo "Syncing Bootstrap"
SANDBOX="$SANDBOX_USER@$SANDBOX_HOST"
scp -r ./bootstrap $SANDBOX:
