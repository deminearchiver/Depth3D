package de.math
{
    public final class Transform
    {
        public var x: Number = 0;
        public var y: Number = 0;
        public var width: Number = 0;
        public var height: Number = 0;
        public var rotation: Number = 0;

        public function Transform(x: Number = 0, y: Number = 0, width: Number = 0, height: Number = 0, rotation: Number = 0)
        {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
            this.rotation = rotation;
        }
    }
}