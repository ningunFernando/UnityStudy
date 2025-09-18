//Figures
void CircleSDF_float(float2 UV, float Radius, out float Dist){
    Dist = length(UV) - Radius;
}

void SquareSDF_float(float2 UV, float2 Size, out float Dist){
    float2 d = abs(UV) - Size;
    Dist = length(max(d,0.0)) + min(max(d.x, d.y), 0.0);
}

void StarSDF_float(float2 UV,float k, float Radius, out float Dist){
    float r = length(UV);
    float theta = atan2(UV.y, UV.x);

    float targetR = max(0.0, sin(k * theta)) * (Radius / 2);

    Dist = r - targetR;
}

//Effects
void OutlineSDF_float(float Distance, float Thickness, out float Dist){
    Dist = abs(Distance) - Thickness;
}

void InlineSDF_float(float Distance, float Thickness, out float Dist){
    Dist = max(Distance, -Distance - Thickness);
}