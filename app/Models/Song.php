<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Song extends Model
{
    protected $table = 'song';
    
    protected $fillable = [
        'title', 
        'duration', 
        'album_id',
    ];

    public function album()
    {
        return $this->belongsTo(Album::class, 'album_id');
    }
}
