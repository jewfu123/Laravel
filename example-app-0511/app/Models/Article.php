<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Article extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'id',
        'title',
        'content',
        'state',
        'user_id',
        'deleted_at',
        'updated_at',
    ];

    public function user() {
        return $this->belongsTo('App\Models\User');
    }
}
