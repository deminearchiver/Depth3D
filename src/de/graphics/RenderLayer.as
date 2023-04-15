package de.graphics
{
    import flash.display.MovieClip;

    internal final class RenderLayer
    {
        private var _renderer: Renderer;
        public function get renderer(): Renderer
        {
            return this._renderer;
        }

        private var _name: String;
        public function get name(): String
        {
            return this._name;
        }
        internal function setName(value: String): void
        {
            this._name = value;
            this.clip.name = this._name;
        }

        
        internal var clip: MovieClip = null;

        public function RenderLayer(renderer: Renderer, name: String)
        {
            this._renderer = renderer;
            this.clip = new MovieClip();
            this.setName(name);
        }
    }
}