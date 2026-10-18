# rs2 (Ready-to-Play Build)

A precompiled single-player build of the [rs2](https://gitlab.com/single-player/rs2) server (RuneScape build 530, January 2009), based on [2009scape](https://gitlab.com/2009scape/2009scape), bundled with the game client and a Java runtime.

No manual Java installation or separate server/client startup is required. Simply launch the game using `launch.bat`.

This build is updated continuously and follows the latest changes in the source repository. Check this repository's commit history to see which source revision the current build is based on.

> Not affiliated with Jagex or the upstream 2009scape team.

## Requirements

- **Windows:** The included `launch.bat` is designed for Windows.
- **Java:** A bundled Java runtime is provided in `jre/`.
- **Memory:** The launcher allocates 2 GB of RAM to the server and 1 GB to the client. Additional memory may be needed depending on your configuration.
- **Database:** No database is required for the default single-player setup.

## Quick Start

1. Extract the complete archive to a folder of your choice.
2. Run `launch.bat`.
3. Wait for the server to start. The launcher automatically detects when port `43595` becomes available and then starts the client.
4. Log in using any username and password. Your account is created on first login.

Keep the launcher running while playing. Closing the launcher terminates the Java processes started by it.

Your player data is stored in `game/data/players/` and persists between sessions.

**Important:** Do not run multiple instances of the launcher simultaneously. If port `43595` is already in use, the launcher will refuse to start another server instance.

## Directory Layout

```text
.
├── launch.bat                   # Starts the server and client
├── jre/                         # Bundled Java runtime
└── game/
    ├── server.jar               # Game server
    ├── client.jar               # Game client
    ├── worldprops/
    │   └── default.conf         # Server configuration
    └── data/
        ├── cache/               # Game cache
        ├── configs/             # JSON configuration files
        ├── players/             # Player saves
        ├── eco/                 # Grand Exchange state
        ├── botdata/             # Bot data (deprecated)
        ├── playerstats/         # Kill counts and rare drops
        ├── serverstore/         # Server storage
        └── logs/                # Server logs
```

The launcher changes the working directory to `game/` before starting the server and client. This ensures that relative paths such as `worldprops/` and `data/` resolve correctly.

## Configuration

Stop the game before editing `game/worldprops/default.conf`. Restart the launcher for configuration changes to take effect.

Commonly changed settings:

| Key | Default | Effect |
|---|---|---|
| `use_auth` | `false` | Disables database-backed password authentication. |
| `persist_accounts` | `false` | Disables database persistence for account metadata such as credits and playtime. Player saves remain stored locally. |
| `noauth_default_admin` | `true` | Grants admin privileges when the relevant `use_auth` and `dev` conditions are met. |
| `secret_key` | `2009scape_development` | Must match the client configuration. Do not change it without updating the client accordingly. |
| `preload_map` | `false` | Loads the map into memory during startup when enabled; requires additional RAM. |
| `default_xp_rate` | `1.0` | Sets the default XP multiplier. |
| `autostock_ge` | `false` | Automatically stocks the Grand Exchange using `data/eco/ge_autostock.json`. |
| `i_want_to_cheat` | `false` | Enables Grand Exchange auto-buy and auto-sell features. |
| `log_level` / `write_logs` | `verbose` / `true` | Controls logging verbosity and file logging. |
| `data_path` | `data` | Sets the base directory for game data, including caches, saves and configurations. |

All configuration options are documented in `game/worldprops/default.conf`. For the complete configuration reference, see the [source repository](https://gitlab.com/single-player/rs2).

## Saves and Backups

Back up the following directories before updating the game or changing its configuration:

- `game/data/players/` — player accounts and saved progress.
- `game/data/eco/` — Grand Exchange state.

Keep these directories when replacing the game files with a newer build if you want to preserve your progress.

## Updating

1. Close the client and exit the launcher.
2. Make backups of `game/data/players/` and `game/data/eco/`.
3. Replace the old game files with the new release files.
4. Restore your backed-up player and eco data if necessary.
5. Compare your existing `game/worldprops/default.conf` with the new version, as configuration options may be added, removed or renamed.

Avoid overwriting your existing save data when updating.

## Troubleshooting

| Problem | Possible cause and solution |
|---|---|
| `Bundled JRE not found` | The Java runtime is missing from `jre/`. Re-extract the complete archive. |
| `server.jar not found` | `game/server.jar` is missing. Restore it from the release archive. |
| `client.jar not found` | `game/client.jar` is missing. Restore it from the release archive. |
| `worldprops/default.conf not found` | The server configuration is missing. Restore it from the release archive. |
| Port `43595` is already in use | Another server instance or another application is using the port. Close the existing instance before launching the game. |
| Client does not start | The server may still be starting, or it may have failed to launch. Check the server output and logs. |
| The console repeatedly prints `Still waiting for the server to start...` | The launcher has not detected the server listening on port `43595`. One known cause is extracting the game to a path containing spaces, such as `C:\\Users\\My Name\\Documents\\game`. Move the game folder to a path without spaces. |

## License

The server source code is licensed under [AGPL-3.0](https://gitlab.com/single-player/rs2/-/blob/master/LICENSE), inherited from upstream.

The game cache and assets belong to Jagex and are not licensed by this project. The bundled Java runtime is subject to its own license terms, available in `jre/legal/` where provided.
