#version 100

attribute vec3 vert;
attribute vec2 vertTexCoord;

varying vec2 fragTexCoord;
varying float fragTransparency;

uniform mat4 projection;
uniform mat4 view;

uniform vec2 position;
uniform float rotation;
uniform vec2 scale;
uniform vec2 offset;
uniform vec2 sprite_offset;
uniform vec2 sprite_scale; 
uniform float z_index;
uniform float transparency;

void main() {
    fragTexCoord = sprite_offset + vertTexCoord * sprite_scale;
    fragTransparency = transparency;

    float sr = sin(rotation);
    float cr = cos(rotation);

    mat4 offset_mat = mat4(1.0);
    offset_mat[3][0] = -offset.x;
    offset_mat[3][1] = -offset.y;

    mat4 scale_mat = mat4(1.0);
    scale_mat[0][0] = scale.x;
    scale_mat[1][1] = scale.y;

    mat4 rotation_mat = mat4(1.0);
    rotation_mat[0][0] = cr;
    rotation_mat[0][1] = sr;
    rotation_mat[1][0] = -sr;
    rotation_mat[1][1] = cr;

    mat4 position_mat = mat4(1.0);
    position_mat[3][0] = offset.x + position.x;
    position_mat[3][1] = offset.y + position.y;
    position_mat[3][2] = z_index;
    
    mat4 world = position_mat * rotation_mat * scale_mat * offset_mat;

    gl_Position = projection * view * world * vec4(vert, 1);
}