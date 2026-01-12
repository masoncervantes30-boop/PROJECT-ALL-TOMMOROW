shader_type canvas_item;

uniform float scale = 6.0;
uniform float intensity = 0.06;

float rand(vec2 v) {
    return fract(sin(dot(v, vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = UV * scale;
    float n = rand(floor(uv));
    float shade = 0.95 + (n - 0.5) * intensity;
    COLOR = vec4(vec3(shade), 1.0);
}
