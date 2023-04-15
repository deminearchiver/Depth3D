package de.util
{
    import flash.display.MovieClip;
    import flash.display.DisplayObject;
    import avmplus.getQualifiedClassName;

    public function searchForMovieClips(clip: MovieClip, identifier: String, depth: uint = 0): Array
    {
        var found: Array = [];
        for(var i: int = 0; i < clip.numChildren; i++)
        {
            var child: DisplayObject = clip.getChildAt(i);
            if(child == null) continue;
            if(getQualifiedClassName(child) === identifier)
            {
                found.push(child);
            }
            else if(child is MovieClip && (child as MovieClip).numChildren > 0 && depth > 0)
            {
                var result: Array = searchForMovieClips(child as MovieClip, identifier, depth - 1);
                if(result != null) found.push(result);
            }
        }
        return found; 
    }
}