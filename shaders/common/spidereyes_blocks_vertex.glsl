#include "/lib/config.glsl"

/* Uniforms */

uniform mat4 gbufferProjectionInverse;

#if defined SHADOW_CASTING && !defined NETHER
    uniform mat4 gbufferModelViewInverse;
#endif

/* Ins / Outs */

varying vec2 texcoord;

/* Utility functions */

#if AA_TYPE > 0
    #include "/src/taa_offset.glsl"
#endif

// MAIN FUNCTION ------------------

varying float muFogCoord;  // eye-space distance (see gl_FogFragCoord shim in /lib/config.glsl)

void main() {
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;

    #include "/src/position_vertex.glsl"
}