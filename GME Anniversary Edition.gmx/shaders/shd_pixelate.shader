attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 pixel; //background width, background height, pixel width, pixel height
void main()
{
    vec2 ts = vec2(pixel.z*(1./pixel.x),pixel.w*(1./pixel.y));
    vec2 coord = vec2(ts.x*floor(v_vTexcoord.x/ts.x),ts.y*floor(v_vTexcoord.y/ts.y));
    gl_FragColor = texture2D(gm_BaseTexture, coord);
}
