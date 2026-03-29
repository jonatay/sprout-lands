shader_type canvas_item;

uniform float alpha_threshold : hint_range(0.0, 1.0) = 0.1;

void fragment() {
	if (COLOR.a >= alpha_threshold) {
	    COLOR = vec4(COLOR.r, COLOR.g, COLOR.b, 1.0);
	} else {
	    COLOR = vec4(COLOR.r, COLOR.g, COLOR.b, 0.0);
	}
}

