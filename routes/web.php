<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here you can register all the routes for an application.
| It's a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

// Basic route that returns the Lumen version
$router->get('/', function () use ($router) {
    return $router->app->version();
});

// Albums
$router->get('/api/albums', 'AlbumController@getAll'); 
$router->get('/api/albums/{id}', 'AlbumController@getOne');

// CRUD operations on albums
$router->post('/api/albums', 'AlbumController@save'); 
$router->put('/api/albums/{id}', 'AlbumController@update'); 
$router->delete('/api/albums/{id}', 'AlbumController@delete');

// Singers
$router->get('/api/singers', 'SingerController@index'); 
$router->get('/api/singers/{id}', 'SingerController@show'); 

// Songs
$router->get('/api/songs', 'SongController@index'); 
$router->get('/api/songs/{id}', 'SongController@show');
