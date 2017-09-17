///pal_swap_init_system(shader_index);

/*
**  Usage:
**      pal_swap_init_system(shader_index);
**
**  Arguments:
**      shader_index: Name of the shader.
**
**  Function:
**      Initiates the palette swapping system.
*/

globalvar Pal_Shader, Pal_Texel_Size, Pal_UVs, Pal_Index, Pal_Texture;

Pal_Shader = argument[0];
Pal_Texel_Size = shader_get_uniform(argument[0], 'texel_size');
Pal_UVs = shader_get_uniform(argument[0], 'palette_UVs');
Pal_Index = shader_get_uniform(argument[0], 'palette_index');
Pal_Texture = shader_get_sampler_index(argument[0], 'palette_texture');
