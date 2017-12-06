attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 fragCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    fragCoord = in_Position.xy;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 fragCoord;
uniform vec2  iResolution; // viewport resolution (in pixels)
uniform float iGlobalTime; // shader playback time (in seconds)
uniform sampler2D tex_water;

#define speed 3.0
#define xDistMag 0.00125
#define yDistMag 0.00125
#define xSineCycles 6.126
#define ySineCycles 6.126

void main()
{
    vec2 uv = vec2(fragCoord.x,fragCoord.y);
    
    uv = fragCoord.xy / iResolution.xy;

    float time = iGlobalTime*speed;
    float xAngle = time + fragCoord.y * ySineCycles;
    float yAngle = time + fragCoord.x * xSineCycles;
            
    vec2 distortOffset = 
    vec2(sin(xAngle), sin(yAngle)) * // amount of shearing
    vec2(xDistMag,yDistMag); // magnitude adjustment
    
    uv += distortOffset;    
          
    gl_FragColor = texture2D(tex_water, uv);
}
