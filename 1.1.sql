select trackid , "name" , duration from tracks
where duration = (select MAX(duration) from tracks);