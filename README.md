# rs2 (ready-to-play build)

Precompiled singleplayer build of the [rs2](https://gitlab.com/single-player/rs2) server (RuneScape build 530, January 2009, based on [2009scape](https://gitlab.com/2009scape/2009scape)) together with a client and a bundled Java runtime. Download, start the server, start the client.

This build is updated continuously and follows the latest changes in the source repository. Check the commit history of this repository for the date of the current build.

> Not affiliated with Jagex or the upstream 2009scape team.

## Requirements

- No Java installation needed: a JRE is bundled in `jre/`.
- Free RAM for the server; with `preload_map = true` it needs about 2 GB more.
- No database.

## Quick start

1. Start the server:
    - Windows: `run_server.bat`
    - Linux: `./run_server.sh`
2. Wait until the server finishes loading.
3. Start the client:
    - Windows: `run_client.bat`
    - Linux: `./run_client.sh`
4. Log in with any username and password. The account is created on first login.

Keep the server window open while playing. Closing it stops the game; progress is saved to `game/data/players/`.

## Linux

The `.sh` scripts expect a Java runtime at `jre/bin/java`. If the bundled `jre/` is built for Windows, replace it with a Java 11 runtime for your platform, keeping the same path. Make the scripts executable if needed:

```bash
chmod +x run_server.sh run_client.sh
```

## Directory layout

```
.
├── game/
│   ├── server.jar
│   ├── client.jar
│   ├── worldprops/default.conf   # server configuration
│   └── data/
│       ├── cache/                # game cache
│       ├── configs/              # JSON configs (shops, NPCs, items, drop tables)
│       ├── players/              # player saves
│       ├── eco/                  # Grand Exchange state
│       ├── botdata/              # bot data (Deprecated)
│       ├── playerstats/          # kill counts, rare drops
│       ├── serverstore/
│       └── logs/
├── jre/                          # bundled Java runtime
├── run_server.bat / run_server.sh
└── run_client.bat / run_client.sh
```

Both scripts change into `game/` before launching, so `worldprops/` and `data/` are always resolved relative to it.

## Configuration

Edit `game/worldprops/default.conf` while the server is stopped, then restart. Commonly changed keys:

| Key                        | Default                 | Effect                                                                                                 |
|----------------------------|-------------------------|--------------------------------------------------------------------------------------------------------|
| `use_auth`                 | `false`                 | Passwords are not checked against a DB.                                                                |
| `persist_accounts`         | `false`                 | Account data (credits, playtime) is not written to a DB. Save data (stats, inventory) is still stored. |
| `noauth_default_admin`     | `true`                  | Every player gets admin privileges (only when `use_auth = false` and `dev = true`).                    |
| `secret_key`               | `2009scape_development` | Must match the client; do not change unless you also change the client.                                |
| `preload_map`              | `false`                 | `true` loads the map into memory at startup.                                                           |
| `default_xp_rate`          | `1.0`                   | XP multiplier.                                                                                         |
| `autostock_ge`             | `false`                 | Automatically stocks the Grand Exchange (configured in `data/eco/ge_autostock.json`).                  |
| `i_want_to_cheat`          | `false`                 | Enables GE auto-buy/auto-sell.                                                                         |
| `log_level` / `write_logs` | `verbose` / `true`      | Log verbosity and file logging.                                                                        |
| `data_path`                | `data`                  | Base dir for cache, saves, configs.                                                                    |

Every key is documented inline in the file. See the [source README](https://gitlab.com/single-player/rs2) for the full table.

## Saves and backups

Back up these two folders before updating or editing the config:

- `game/data/players/`: player saves
- `game/data/eco/`: Grand Exchange state

## Updating

1. Close the client and stop the server.
2. Back up `game/data/players/` and `game/data/eco/`.
3. Replace the files from the new release, but keep your own `game/data/players/` and `game/data/eco/`.
4. Compare your `game/worldprops/default.conf` with the new one, since keys can be added or renamed between releases.

## Troubleshooting

| Message                             | Cause                                                                                       |
|-------------------------------------|---------------------------------------------------------------------------------------------|
| `Bundled JRE not found`             | `jre/bin/java` is missing or not executable. Re-extract the archive or see [Linux](#linux). |
| `server.jar not found`              | `game/server.jar` is missing. Re-extract the archive.                                       |
| `worldprops/default.conf not found` | `game/worldprops/default.conf` is missing. Restore it from the release.                     |
| Client stuck on loading             | The server is not running or has not finished starting.                                     |

## License

[AGPL-3.0](https://gitlab.com/single-player/rs2/-/blob/master/LICENSE), inherited from upstream. Game cache and assets belong to Jagex and are not licensed by this project. The bundled Java runtime is covered by its own license files in `jre/legal/`.