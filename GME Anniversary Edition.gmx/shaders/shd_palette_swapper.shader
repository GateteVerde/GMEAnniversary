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

//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;

void main()
{
    vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
    
    DoAlphaTest( source );
    
    for(float i = palette_UVs.y; i < palette_UVs.w; i+=texel_size.y )
    {
        if (distance(source, texture2D(palette_texture, vec2(palette_UVs.x, i))) <= 0.004)
        {
            float palette_V = palette_UVs.x + texel_size.x * palette_index;
            source = texture2D(palette_texture, vec2(palette_V, i));
            break;
        }
    }

    gl_FragColor = source * v_vColour;
}
