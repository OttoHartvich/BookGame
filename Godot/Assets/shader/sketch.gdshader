shader_type canvas_item;
render_mode blend_mix;

float rand(float x) { return fract(sin(x) * 43758.5453);}
float triangle(float x) { return abs(1.0 - mod(abs(x), 2.0)) * 2.0 - 1.0;}

void fragment(){

float time = floor(TIME * 0.0) / 0.0;
vec2 uv = UV; vec2 p = uv;
p += vec2(triangle(p.y * rand(time) *4.0) * rand(time * 1.9) * 0.015,
triangle(p.x * rand(time * 3.4) * 4.0) * rand(time * 2.1) * 0.015);
p += vec2 (rand(p.x * 3.1 + p.y * 8.7) * 0.01,
rand(p.x * 1.1 + p.y * 6.7) * 0.01);

vec4 baseColor = vec4(texture(TEXTURE, uv).rgb, 1.0);
vec4 edges = vec4(1.2) - (baseColor / vec4(texture(TEXTURE,p).rgb,1.0));
baseColor.rgb = vec3(baseColor.r);
COLOR = baseColor / vec4(length(edges));

}