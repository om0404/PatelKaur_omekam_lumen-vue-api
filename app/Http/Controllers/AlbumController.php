<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Album;
use App\Models\Singer; 

class AlbumController extends Controller {
    /**
     * Retrieve all albums with their corresponding singer details.
     *
     * @return \Illuminate\Http\JsonResponse
     */
     public function getAll() {
         $albums = Album::join('singer', 'singer_id', '=', 'singer.id')
                        ->select('album.id', 'album.title', 'release_date', 'name as singer_name')
                        ->orderBy('release_date', 'desc')
                        ->get();

         return response()->json($albums);
     }

     /**
      * Retrieve a single album by its ID with singer details.
      *
      * @param  int  $id
      * @return \Illuminate\Http\JsonResponse
      */
     public function getOne($id) {
        $album = Album::join('singer', 'singer_id', '=', 'singer.id')
                      ->select('album.id', 'album.title', 'release_date', 'name as singer_name')
                      ->where('album.id', $id)
                      ->first(); // Using first() since we are retrieving a single record

        return response()->json($album);
     }

     /**
      * Create a new album.
      *
      * @param  \Illuminate\Http\Request  $request
      * @return \Illuminate\Http\JsonResponse
      */
     public function save(Request $request) {
        $this->validate($request, [
            'title' => 'required',
            'singer_id' => 'required|integer',
            'release_date' => 'required|date'
        ]);
        $album = Album::create($request->all());

        return response()->json($album, 201);
    }
    
    /**
     * Update an existing album.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id) {
        $album = Album::findOrFail($id);
    
        $this->validate($request, [
            'title' => 'required',
            'singer_id' => 'required|integer',
            'release_date' => 'required|date'
        ]);
        $album->update($request->all());

        return response()->json($album);
    }
    
    /**
     * Delete an album.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete($id) {
        $album = Album::findOrFail($id);
        $album->delete();

        return response()->json(null, 204);
    }
}
