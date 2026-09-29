<div align="center">

# Seintrheim
##### A Valheim QoL modpack for the highly seintred

<img alt="Seintrheim logo" height="280" src="assets/logo.svg" />

![License](https://img.shields.io/github/license/Dwarf1er/seintrheim?style=for-the-badge)
![Issues](https://img.shields.io/github/issues/Dwarf1er/seintrheim?style=for-the-badge)
![PRs](https://img.shields.io/github/issues-pr/Dwarf1er/seintrheim?style=for-the-badge)
![Contributors](https://img.shields.io/github/contributors/Dwarf1er/seintrheim?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/Dwarf1er/seintrheim?style=for-the-badge)

</div>

Modpack for **Forsaken Seintred Realm**, our dedicated Valheim server. This repo tracks the client and server mod lists, our custom config, and this README, which explains what the pack changes.

## Table of Contents

<!-- mtoc-start -->

* [Installing](#installing)
* [What's in the pack](#whats-in-the-pack)
* [Player Manual](#player-manual)
  * [Inventory, storage, and looks](#inventory-storage-and-looks)
  * [Building and crafting](#building-and-crafting)
  * [Farming](#farming)
  * [Traversal and combat](#traversal-and-combat)
  * [World and UI](#world-and-ui)
* [Changelog](#changelog)
* [Maintaining this repo](#maintaining-this-repo)
* [Mod Watchlist](#mod-watchlist)
* [License](#license)

<!-- mtoc-end -->

## Installing

1. Install [Gale](https://gale.kesomannen.com/).
2. Import the client profile via profile sync: `Import > profile from code`, code: `8GWAV8`.
3. Launch through Gale. Follow the connection instructions on our Discord channel.

## What's in the pack

<!-- mods-table:start -->
| Mod                                                                                                                          | Side   | Category                                                            | What it does                                                                                                                                                                                                                                                    |
|------------------------------------------------------------------------------------------------------------------------------|--------|---------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [PlantEasily](https://thunderstore.io/package/Advize/PlantEasily/)                                                           | Client | Misc                                                                | Allows you to plant evenly spaced crops, either one at a time or in any amount of rows and columns, with grid snapping features and invalid crop placement prevention. Harvest in bulk and optionally auto replant crops. Configurable and supports gamepad.    |
| [PlantEverything](https://thunderstore.io/package/Advize/PlantEverything/)                                                   | Both   | Misc                                                                | Allows your cultivator to plant berry bushes, thistle, dandelions, mushrooms, previously unavailable tree types, and other decorative flora. Includes many other miscellaneous features (see description). Highly configurable with localization support.       |
| [AAA_Crafting](https://valheim.hexium.gg/mods/Azumatt/AAA_Crafting)                                                          | Both   | Crafting/Performance/Quality of Life/User Interface                 | AzuAnti-ArthriticCrafting. Gives you an input field to enter the amount of items you want to craft, a search filter feature, and recipe tracking. Controller friendly, with virtual keyboard.                                                                   |
| [AzuAreaRepair](https://valheim.hexium.gg/mods/Azumatt/AzuAreaRepair)                                                        | Both   | Mechanics/Quality of Life                                           | Repair pieces in a specified area around the player when using the hammer to repair.                                                                                                                                                                            |
| [AzuAutoStore](https://valheim.hexium.gg/mods/Azumatt/AzuAutoStore)                                                          | Both   | Mechanics/Quality of Life                                           | Automatically store and deposit items from your inventory or ground into nearby chests and containers. Chest management, hotkey support, quick stack, auto-pickup, favorites, ItemDrawers, backpacks, WardIsLove, ward protection.                              |
| [AzuCraftyBoxes](https://valheim.hexium.gg/mods/Azumatt/AzuCraftyBoxes)                                                      | Both   | Mechanics/Open Source/Quality of Life                               | AzuCraftyBoxes is a Valheim mod that allows players to access and use resources from nearby containers when crafting and building, based on a configurable range and item restrictions. Restrictions are controlled by the yaml file Azumatt.AzuCraftyBoxes.yml |
| [AzuExtendedPlayerInventory](https://valheim.hexium.gg/mods/Azumatt/AzuExtendedPlayerInventory)                              | Both   | Armor/Quality of Life/Storage/Tools/Transmog/User Interface/Visuals | AzuEPI (Extended Player Inventory) is a comprehensive inventory expansion mod that adds more rows to inventory, equipment slots, quick slots, vanity customization, and loadout management to Valheim. Controller friendly.                                     |
| [Official_BepInEx_ConfigurationManager](https://valheim.hexium.gg/mods/Azumatt/Official_BepInEx_ConfigurationManager)        | Client | Config/Quality of Life                                              | Mod to assist with configuration of BepInEx mods                                                                                                                                                                                                                |
| [Unshamed](https://valheim.hexium.gg/mods/Azumatt/Unshamed)                                                                  | Client | Misc                                                                | Valheim 1.0 blocks achievements for anyone running mods. This unblocks them, and gives back the ones you already earned. No free unlocks.                                                                                                                       |
| [VikingsDoSwim](https://valheim.hexium.gg/mods/blacks7ar/VikingsDoSwim)                                                      | Both   | Mechanics/Quality of Life                                           | A simple mod that lets you configure Max Swim Speed at max swim skill level. Scales your swim speed, stamina regen and stamina consumption to your swim skill level. Adds a new diving mechanic that lets you swim underwater.                                  |
| [WieldEquipmentWhileSwimming](https://valheim.hexium.gg/mods/blacks7ar/WieldEquipmentWhileSwimming)                          | Both   | Combat/Quality of Life                                              | A simple mod that lets you wield your equipments while swimming/diving or in water (Configurable).                                                                                                                                                              |
| [ComfyAutoRepair](https://thunderstore.io/package/ComfyMods/ComfyAutoRepair/)                                                | Client | Tweaks                                                              | Interact with a crafting station to auto-repair all items in your inventory.                                                                                                                                                                                    |
| [BepInExPack_Valheim](https://valheim.hexium.gg/mods/denikson/BepInExPack_Valheim)                                           | Both   | Misc                                                                | BepInEx pack for Valheim. Preconfigured with the correct entry point for mods and preferred defaults for the community.                                                                                                                                         |
| [Quick_Stack_Store_Sort_Trash_Restock](https://thunderstore.io/package/Goldenrevolver/Quick_Stack_Store_Sort_Trash_Restock/) | Both   | Misc                                                                | Quick Stacking, Sorting, Trashing and more in one cohesive package                                                                                                                                                                                              |
| [Awakened_Hearthstone](https://thunderstore.io/package/IceHearthPatriots/Awakened_Hearthstone/)                              | Client | Tweaks/Misc/Tools/Crafting/Utility/Vehicles/Transportation          | Craftable Hearthstones that teleport you to your bed without losing gear. Normal (30 min cooldown) respects portal rules. Awakened (15 min, Black Forge) bypasses all restrictions. Cooldowns pause while offline. Server-compatible.                           |
| [NoRainDamage](https://thunderstore.io/package/JoelOliMclean/NoRainDamage/)                                                  | Client | Tweaks/Misc/Tools/Utility/Building                                  | Stops rain from damaging unroofed wood/turf structures over time; configurable per building piece.                                                                                                                                                              |
| [FuelEternal](https://thunderstore.io/package/Marf/FuelEternal/)                                                             | Both   | Tweaks/Misc                                                         | Fuel Eternal is a reimagining of TorchesEternal with updated support for stone ovens and hot tubs, along side an adjustable config to enable/disable options of your choosing.                                                                                  |
| [Immersive_Portals](https://valheim.hexium.gg/mods/Max/Immersive_Portals)                                                    | Client | Open Source/Visuals                                                 | See through your portals. Cosmetic, client-side: each trip photographs the view from a portal and its partner shows it as a window with real parallax, the live sky and time-of-day lighting. The far side is never loaded.                                     |
| [Seasonality](https://valheim.hexium.gg/mods/RustyMods/Seasonality)                                                          | Both   | Misc                                                                | Dynamic seasons by altering textures and colors, providing an immersive environmental experience that changes with time.                                                                                                                                        |
| [ConditionalConfigSync](https://valheim.hexium.gg/mods/shudnal/ConditionalConfigSync)                                        | Both   | Config/Open Source/Tools                                            | Shared config synchronization and server policy library for Valheim mods. Installed as a dependency and compatible with Jotunn and ServerSync.                                                                                                                  |
| [MyLittleUI](https://valheim.hexium.gg/mods/shudnal/MyLittleUI)                                                              | Both   | Config/Open Source/Quality of Life/User Interface                   | Bunch of little UI tweaks. Tooltips for production timers, player status, items. Custom chest names, buff list, multicraft, weather forecast, crafting sorting, filtering and so on.                                                                            |
| [FloorsAreRoofsContinued](https://thunderstore.io/package/TheOneHyer/FloorsAreRoofsContinued/)                               | Both   | Tweaks/Utility                                                      | Makes floor pieces (including Ashlands-tier ones) count as roofs, so buildings under them don't take rain damage.                                                                                                                                               |
| [ForsakenPowersPlusRemastered](https://valheim.hexium.gg/mods/turbero/ForsakenPowersPlusRemastered)                          | Both   | Misc                                                                | Remastered mod to enable any boss you have earned. Change the forsaken powers with a button and modify the duration and cooldown, use passive mode or power stacking. Configure it to your liking.                                                              |
| [Jotunn](https://valheim.hexium.gg/mods/ValheimModding/Jotunn)                                                               | Both   | Open Source                                                         | Jötunn (/ˈjɔːtʊn/, 'giant'), the Valheim Library was created with the goal of making the lives of mod developers easier. It enables you to create mods for Valheim using an abstracted API so you can focus on the actual content creation.                     |
| [YamlDotNet](https://valheim.hexium.gg/mods/ValheimModding/YamlDotNet)                                                       | Both   | Open Source                                                         | Shared version 16.3.0 of YamlDotNet from Antoine Aubry and contributors, net47 package for use in Valheim mods. Maintained by the ValheimModding team.                                                                                                          |
| [No_Seasonal_Restrictions](https://thunderstore.io/package/VentureValheim/No_Seasonal_Restrictions/)                         | Client | Tweaks/Building                                                     | If you hate seasons, use this to enable all seasonal items. Yule be glad to install this mod!                                                                                                                                                                   |
<!-- mods-table:end -->

Full exact versions live in [`client/modlist.md`](client/modlist.md) and [`server/modlist.md`](server/modlist.md). Those two lists differ because a handful of mods (UI, cosmetic, or client-only conveniences) don't need to run on the dedicated server.

## Player Manual

Everything below is stuff the mods add that vanilla Valheim doesn't include. Config is per-client via `F1` (opens the BepInEx config manager window), though a lot of settings are locked to whatever the server has set, so don't be surprised if some of these numbers aren't changeable for you.

### Inventory, storage, and looks

- Press `.` next to any container to dump your whole inventory into it, for any item it already has a stack of.
- Press `Y` when clicking on an item in your inventory to highlight the chest where the items are stored.
- Drop items on the ground near a container that has an *incomplete* stack of that item and it'll get pulled in automatically after a few seconds.
- Chests/Inventory also get quick-stack, restock, auto-sort, and trash-item buttons; look for them in the container's UI when it's open.
- You get quick-action slots (default `Alt` + `Z` / `X` / `C` / `V` / `B` / `N` / `1` / `2`, up to 8 total) for things like swapping arrows or eating without opening your inventory. Adjust the keybinds under `F1`.
- You can transmog your character to look like you're wearing different gear, or nothing at all. (Best example is transmog-ing your head piece to be the dverger circlet to get the light source while still being protected by your armor's actual helmet)
- You can save multiple equipment loadouts and swap between them instead of manually re-equipping every time you change roles (mining vs. fighting vs. farming).

### Building and crafting

- Floor pieces (including the Ashlands-tier ones) count as roofs now, so whatever's underneath them doesn't take rain damage. Combined with the general no-rain-damage tweak, you don't need to fully roof a build just to protect it.
- Crafting stations pull materials from any container within range, so you don't have to hand-carry resources to the workbench before building.
- The crafting UI lets you type an exact quantity to craft instead of clicking one at a time, plus a search filter for recipes.
- Fuel (campfires, kilns, smelters, etc.) refills itself. You don't need to babysit it.
- Repairing one piece with the hammer repairs every damaged structure in a radius around it, not just the one piece you're aiming at.
- Interacting with a crafting station also auto-repairs everything repairable in your inventory.

### Farming

- The cultivator can plant wild pickables now, not just normal crops: berry bushes, mushrooms, thistle, dandelion, saplings, and other decorative flora.
- `Shift` + `E` while harvesting does a mass harvest in the area around the player.
- `Right Control` + `Up`/`Down`/`Left`/`Right` while planting lets you configure the size of the grid in which you wish to plant.
- Seasonal decorations (holiday trees, gift boxes, etc.) are unlocked year-round instead of only during their real-world date window, so you're not stuck waiting for a specific week to use them.

### Traversal and combat

- Hold `Ctrl` while in water to dive; press `Space` to surface. Swim speed at max skill is also higher than vanilla.
- You can keep your weapon and gear equipped and usable while swimming or diving, instead of being stuck unarmed in the water.
- Craftable Hearthstones teleport you back to your bed with your inventory intact: a normal one respects portal metal restrictions, an "Awakened" one (needs a Black Forge) bypasses them. Cooldowns pause while you're offline either way. We recommend putting it in one of your quickslots for a fast getaway.
- `F8` cycles through the Forsaken Powers you've unlocked and activates the one you land on. Duration/cooldown and stacking behavior are configurable, so check with whoever manages the server config if something feels off.

### World and UI

- The world actually cycles through four seasons over time, changing textures, colors, and weather, instead of every biome always looking the same.
- The UI mod adds a bunch of small conveniences: production timers on stations, custom chest names, a weather forecast, and better crafting sort/filter.
- Vanilla achievements still unlock even though we're running mods (Valheim normally blocks that once mods are detected). If you already had some blocked, they get retroactively granted, no free unlocks.

## Changelog

See [`CHANGELOG.md`](CHANGELOG.md) for version history.

## Maintaining this repo

This repo updates itself. `.github/workflows/sync-modlists.yml` runs daily as a safety net, and on-demand from the Actions tab (`Run workflow`) whenever you want it sooner:

1. Pulls the client and server profiles' current manifests from Gale's [profile sync](https://github.com/Kesomannen/gale-sync) API (reading a manifest needs no login) and rewrites `client/modlist.md`/`server/modlist.md` if either changed.
2. Adds a dated entry to `CHANGELOG.md` listing whatever mods got added/removed, per side, via `.github/scripts/update_changelog.sh`. It's a no-op if neither modlist actually changed.
3. Regenerates the table above from those files via `.github/scripts/update_readme.sh`: link, side, category, and description all come from the Hexium/Thunderstore package API. `.github/scripts/overrides.json` (keyed `"Namespace/Name"`) patches over any mod whose upstream description is bad or misleading.
4. Commits and pushes straight to `master`, only if something actually changed.

So the only thing an admin needs to do is `Push update` from Gale; the repo catches up on its own. There's no webhook for profile-sync pushes, so this is polling on a schedule, not instant; adjust the cron in the workflow or trigger it manually.

The two profile sync IDs it polls live in this repo's Settings > Secrets and variables > Actions > Variables, as `CLIENT_GALE_PROFILE_SYNC_ID` and `SERVER_GALE_PROFILE_SYNC_ID`. They're not secret; they only grant read access to the same manifest the sync code already shares.

Config files (the actual BepInEx `.cfg`s) aren't part of this automation: profile sync bundles them, but this pipeline only reads the manifest metadata, not the files themselves, so `server/config/` still needs to be updated by hand when a config changes on the server.

## Mod Watchlist

This is a list of mods that are currently under evaluation to be added to the modlist:

- [TeleportEverything](https://valheim.hexium.gg/mods/OdinPlus/TeleportEverything)
- [Pathfinder](https://thunderstore.io/c/valheim/p/Crystal/Pathfinder/)
- [SpeedyPaths](https://thunderstore.io/c/valheim/p/Nextek/SpeedyPaths/)
- [No_Seasonal_Restrictions](https://thunderstore.io/c/valheim/p/VentureValheim/No_Seasonal_Restrictions/)
- [SaveCrossbowState](https://valheim.hexium.gg/mods/Azumatt/SaveCrossbowState)
- [PetPantry](https://valheim.hexium.gg/mods/Azumatt/PetPantry)
- [PlanBuild](https://thunderstore.io/c/valheim/p/MathiasDecrock/PlanBuild/)
- [HUDCompass](https://thunderstore.io/c/valheim/p/Neobotics/HUDCompass/)
- [LazyVikings](https://thunderstore.io/c/valheim/p/blacks7ar/LazyVikings/)
- [ServerSideMap](https://thunderstore.io/c/valheim/p/Mydayyy/ServerSideMap/)

## License

This software is licensed under the [MIT license](LICENSE).
