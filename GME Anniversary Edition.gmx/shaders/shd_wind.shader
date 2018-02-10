attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vPosition;
varying vec4 v_vColour;
varying vec2 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position, 1);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vPosition = in_Position.xy;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~

varying vec2 v_vPosition;
varying vec4 v_vColour;
varying vec2 v_vTexcoord;

uniform float Time;
vec2 Size = vec2(144,144);
vec2 Wave = vec2(24,2.5);

void main()
{
    vec2 Coord = v_vTexcoord + vec2(cos((v_vPosition.y/Wave.x+Time)*6.2831)*Wave.y,0)/Size*(1.0-v_vTexcoord.y);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord);
}
