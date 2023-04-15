package de.util
{
    import de.math.Vec2;
    import flash.geom.Matrix;
    import flash.display.MovieClip;

    public function convertFromParent(clip: MovieClip, point: Vec2): Vec2 {
        var m: Matrix = clip.transform.matrix;
        return new Vec2(
            ((clip.x + ((clip.y - point.y) / (-m.d)) * m.c - point.x) / (-m.a)) / (1 - (m.b * m.c) / (m.d * m.a)),
            ((clip.y + ((clip.x - point.x) / (-m.a)) * m.b - point.y) / (-m.d)) / (1 - (m.c * m.b) / (m.a * m.d))
        );
    }
}