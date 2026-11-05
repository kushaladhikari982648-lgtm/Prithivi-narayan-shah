# MakeUp Ultra Fast — Mobile Edition
High performance Minecraft shader (Java), tuned to run on low-end phones.

## Version: 9.7 (Mobile Optimized)

### This version works in Optifine, Iris 1.5.1 or higher, and Horizon-based launchers.

## Runs on Horizon / Volt-launcher too
The pack is compatible with [Volt-launcher](https://github.com/entitybrian69-bit/Volt-launcher)
(Horizon, the Rust/Vulkan engine for Minecraft Java), which loads Iris/OptiFine-format
packs through its own GLSL-to-WGSL translator:

* The legacy `gl_FogFragCoord` builtin (which Horizon's translator doesn't provide) is
  routed through a plain `muFogCoord` varying — same GLSL 1.20 semantics, works on
  every loader
* FXAA uses only portable GLSL literals, and all line endings are normalized to LF
* Install: put the zip (or the extracted folder) into `shaderpacks/` beside
  `options.txt`, then pick it in Options > Horizon Settings > Shader Packs

Effects Horizon doesn't implement yet (e.g. pack-provided cloud/noise textures) fall
back gracefully; with the mobile defaults everything the pack draws is supported.


## Optimized for low-end devices
Defaults are now set so the pack is playable on entry-level hardware such as:

* **MediaTek Helio A22** (PowerVR GE8300 GPU) class phones
* Java Minecraft via PojavLauncher / Zink, or any weak integrated GPU

What changed for mobile:

* **No shadow map pass by default** (biggest single win on tile-based GPUs) — can be re-enabled, starts at lowest resolution (300px / 75 blocks) with fast pixelated shadows
* **No volumetric clouds** — vanilla clouds instead (no per-pixel raymarching)
* **No bloom, no volumetric light, no depth of field, no motion blur, no chromatic aberration**
* **No TAA** — removes the history buffer, jitter and an extra fullscreen pass
* **Ambient occlusion off**, refraction off, material gloss off, colored shadows off
* **Water uses cheap flipped-image reflections** instead of screen-space raymarched reflections (SSR)
* **Fullscreen passes are skipped entirely when their effects are disabled** (`composite1` / `composite2` are only compiled and executed when DoF/Bloom/TAA/Motion Blur are on), saving fill-rate and bandwidth
* Everything above remains a toggle — pick the new **Mobile** profile or turn effects back on in the shader settings if your device can handle more

## Main features
* Optional shadows
* Optional volumetric clouds
* Antialiasing (TAA)
* Depth of field
* Enhanced ambient occlusion
* Water reflection and refraction
* Motion blur
* Optional bloom
* Optional chromatic aberration
* Auto-exposure
* Shader for all native dimensions
* And more...
* FAST!

## Tested on:
* Minecraft 1.12.+ - 26.x
* Nvidia, AMD, Intel
* Windows and Linux
* Low-end ARM Android (Helio A22 / PowerVR GE8300) via PojavLauncher
* Horizon / Volt-launcher (Rust + Vulkan engine, Iris/OptiFine pack loader)

## You can:
* You can use the shader without restrictions.
* You can fork the shader from: [https://github.com/javiergcim/MakeUpUltraFast](https://github.com/javiergcim/MakeUpUltraFast)
* You can modify this shader for any purpose.
* If you modify or use the shader please add a credit, and the official URLs if possible: [https://modrinth.com/shader/makeup-ultra-fast-shaders](https://modrinth.com/shader/makeup-ultra-fast-shaders), [https://www.planetminecraft.com/mod/makeup-ultra-fast-shader/](https://www.planetminecraft.com/mod/makeup-ultra-fast-shader/), [https://www.curseforge.com/minecraft/customization/makeup-ultra-fast-shader](https://www.curseforge.com/minecraft/customization/makeup-ultra-fast-shader) and/or [https://github.com/javiergcim/MakeUpUltraFast](https://github.com/javiergcim/MakeUpUltraFast)

Notification is not required, but would be appreciated.
