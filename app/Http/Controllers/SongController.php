<?php
namespace App\Http\Controllers;

use App\Models\Song;

class SongController extends Controller
{
    public function index()
    {
        $songs = Song::leftjoin('album', 'song.album_id', '=', 'album.id')
        ->leftjoin('singer', 'album.singer_id', '=', 'singer.id')
        ->select(['album.title as album_name', 'album.singer_id', 'album.release_date', 'album.image_url', 'song.title', 'song.duration','song.id',
        'singer.name as singer', 'singer.genre', 'singer.active_years', 'singer.biography'
        ])
        ->get();
        return response()->json($songs);
    }

    public function show($id) {
        $song = Song::where('song.id', $id)->leftjoin('album', 'song.album_id', '=', 'album.id')->leftjoin('singer', 'album.singer_id', '=', 'singer.id')
        ->select(['album.title as album_name', 'album.singer_id', 'album.release_date', 'album.image_url', 'song.title', 'song.duration','song.id',
        'singer.name as singer', 'singer.genre', 'singer.active_years', 'singer.biography'
        ])
        ->first();
        return response()->json($song);
    }
}
