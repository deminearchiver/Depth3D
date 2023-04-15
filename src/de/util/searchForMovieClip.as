package de.util
{
    import flash.display.MovieClip;

    public function searchForMovieClip(clip: MovieClip, identifier: String, depth: uint = 0): MovieClip
    {
        var results: Array = searchForMovieClips(clip, identifier, depth);
        return results[0] ? results[0] as MovieClip : null;
    }
}