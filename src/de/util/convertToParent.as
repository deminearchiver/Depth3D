package de.util
{
    import de.math.Vec2;
    import flash.display.MovieClip;
    import flash.geom.Matrix;

    public function convertToParent(clip: MovieClip, point: Vec2): Vec2 {
        var m: Matrix = clip.transform.matrix;
        return new Vec2(
            clip.x + point.x * m.a + point.y * m.c,
            clip.y + point.x * m.b + point.y * m.d
        );
    }
}