package de.graphics
{
    import flash.display.MovieClip;
    import de.math.Transform;
    import flash.events.Event;
    import de.graphics.RenderLayer;
    import de.util.searchForMovieClips;
    import de.util.searchForMovieClip;

    public class Renderer extends MovieClip
    {
        // Event
        public static const BEFORE_DRAW: String = "beforeDraw";
        public static const AFTER_DRAW: String = "afterDraw";
        
        private static const CAMERA_TYPE_SIMPLE: String = "EXACT";
        private static const CAMERA_TYPE_BINDING: String = "SMOOTH";
        private static const CAMERA_TYPE_ADVANCED: String = "SHURIKEN";

        private static const PROPERTY_CAMERA_TYPE: String = "de_camera_type";



        private var camera: MovieClip = null;
        private var transform: Transform = null;
        private var layers: Object = new Object();
        


        public function Renderer()
        {
            super();       
            
        }


        /**
         * Gets a layer by its name
         */
        protected function getLayer(name: String): RenderLayer {
            return this.layers[name];
        }

        /**
         * Adds a new layer with the specified name
         */
        protected function addLayer(name: String): Renderer
        {
            if(this.getLayer(name)) throw new Error("Layer already exists!");
            
            const layer: RenderLayer = new RenderLayer(this, name);
            this.layers[name] = layer;

            return this;
        }
        /**
         * Rename an already existing layer
         */
        protected function renameLayer(oldName: String, newName: String): RenderLayer
        {
            if(this.getLayer(newName)) throw new Error("Layer already exists!");

            const layer: RenderLayer = this.getLayer(oldName);
            if(!layer) throw new Error("Invalid layer name!");

            layer.setName(newName);
            this.layers[newName] = layer;
            this.layers[oldName] = null;

            return layer;
        }


        private function onEnterFrame(event: Event): void
        {
            if(this.camera == null) return;
            switch(this.camera[Renderer.PROPERTY_CAMERA_TYPE])
            {
                case Renderer.CAMERA_TYPE_SIMPLE:
                    return this.update(new Transform(this.camera.x, this.camera.y, this.camera.width, this.camera.height, this.camera.rotation));
                case Renderer.CAMERA_TYPE_BINDING:
                    return;
                case Renderer.CAMERA_TYPE_ADVANCED:
                    
                    return;
                default:
                    return;
            }
        }

        protected function tryHookAdvancedCamera(identifier: String): Boolean
        {
            var camera: MovieClip = searchForMovieClip(root as MovieClip, identifier);
            if(!camera) return false;
            this.camera = camera;
            this.camera[Renderer.PROPERTY_CAMERA_TYPE] = Renderer.CAMERA_TYPE_ADVANCED;
            
            this.camera.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);

            return true;
        }
        protected function unhookCamera(): Boolean
        {
            if(this.camera == null) return false;

            this.camera.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            this.camera = undefined;

            return true;    
        }


        public function update(camera: Transform): void
        {
            this.transform = camera;

            this.dispatchEvent(new Event(Renderer.BEFORE_DRAW));
            this.draw();
            this.dispatchEvent(new Event(Renderer.AFTER_DRAW));
        }
        private function draw(): void
        {
            
        }






        
    }
}