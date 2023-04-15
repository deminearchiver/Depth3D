package de.math
{
    public class Vec2
    {
        public var x: Number;
        public var y: Number;

        public static function from(array: Array): Vec2
        {
            return new Vec2(array[0], array[1]);
        }

        public function Vec2(x: Number = 0, y: Number = 0)
        {
            this.x = x;
            this.y = y;
        }
    }
}