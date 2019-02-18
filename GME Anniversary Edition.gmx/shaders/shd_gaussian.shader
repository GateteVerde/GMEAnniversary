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
uniform vec3 size;//width,height,radius

const int Quality = 8;
const int Directions = 16;
const float Pi = 6.28318530718;//pi * 2

void main()
{
    vec2 radius = size.z/size.xy;
    vec4 Color = texture2D( gm_BaseTexture, v_vTexcoord);
    for( float d=0.0;d<Pi;d+=Pi/float(Directions) )
    {
        for( float i=1.0/float(Quality);i<=1.0;i+=1.0/float(Quality) )
        {
                Color += texture2D( gm_BaseTexture, v_vTexcoord+vec2(cos(d),sin(d))*radius*i);
        }
    }
    Color /= float(Quality)*float(Directions)+1.0;
    gl_FragColor =  Color *  v_vColour;
}
