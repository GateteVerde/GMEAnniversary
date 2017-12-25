///pal_swap_set(pal_sprite,pal_index);

/*
**  Usage:
**      pal_swap_set(pal_sprite,pal_index);
**
**  Arguments:
**      pal_sprite: Palette sprite
**      pal_index: Palette index
**
**  Function:
**      Set the palette to be used on the object.
*/

//Make sure lightning sheet does not exists
if (!instance_exists(obj_lightningsheet)) {
    
    shader_set(Pal_Shader);
    
    var _pal_sprite = argument[0];
    var _pal_index = argument[1];
    
    var tex = sprite_get_texture(_pal_sprite, 0);
    var UVs = sprite_get_uvs(_pal_sprite, 0);
    
    texture_set_stage(Pal_Texture, tex);
    texture_set_interpolation_ext(Pal_Texture, 1)
    
    var texel_x = texture_get_texel_width(tex);
    var texel_y = texture_get_texel_height(tex);
    var texel_hx = texel_x * 0.5;
    var texel_hy = texel_y * 0.5;
    
    shader_set_uniform_f(Pal_Texel_Size, texel_x, texel_y);
    shader_set_uniform_f(Pal_UVs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
    shader_set_uniform_f(Pal_Index, _pal_index);
}
