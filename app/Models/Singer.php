<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Singer extends Model
{
    protected $table = 'singer'; 

    protected $fillable = [
        'name', 
        'genre', 
        'origin', 
        'active_years',
        'biography',
    ];

    public function albums()
    {
        return $this->hasMany(Album::class, 'singer_id');
    }
}
