# Source layout moved

The reusable library now lives in [packages/murloc-ui](../packages/murloc-ui/README.md).
The test plugin lives in [examples/ui-lab](../examples/ui-lab/README.md).

Build the installable ZIP with `python scripts/package_nilname.py`, or pass
`--library-only` to omit the demo. The installed entry remains
`/scripts/murloc-ui/init.lua`; the old `nilname/scripts` source tree is retired.

See [the architecture](../docs/ui/architecture.md) and
[full AF coverage plan](../docs/ui/coverage/features.md).
