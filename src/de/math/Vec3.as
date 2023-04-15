package de.math
{
    public class Vec3 extends Vec2
    {
        public var z: Number;

        public static function from(array: Array): Vec3
        {
            return new Vec3(array[0], array[1], array[2]);
        }

        public function Vec3(x: Number = 0, y: Number = 0, z: Number = 0)
        {
            super(x, y);
            this.z = z;
        }
    }
}