class Song {
  String title;
  String artist;
  int duration; 


  Song(this.title, this.artist, this.duration);


  void display() {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    print('$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})');
  }
}


class Playlist {
  String name;
  List<Song> songs;


  Playlist(this.name) : songs = [];


  void addSong(Song song) {
    songs.add(song);
  }


  void displayPlaylist() {
    print('Playlist: $name');
    for (var song in songs) {
      song.display();
    }
  }


  void sortByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
  }
}


class MusicFestival {
  String name;
  List<Playlist> stages;


  MusicFestival(this.name) : stages = [];


  void addStage(Playlist playlist) {
    stages.add(playlist);
  }


  int totalFestivalDuration() {
    return stages.fold(0, (sum, playlist) => sum + playlist.songs.fold(0, (songSum, song) => songSum + song.duration));
  }


  void displayFestival() {
    print('Music Festival: $name');
    for (var stage in stages) {
      stage.displayPlaylist();
    }
  }
}


void main() {
  //LANY songs
  Song song1 = Song('ILYSB', 'LANY', 240);
  Song song2 = Song('Malibu Nights', 'LANY', 234);
  Song song3 = Song('Super Far', 'LANY', 221);
  Song song4 = Song('Thru These Tears', 'LANY', 237);
  Song song5 = Song('If This Is the Last Time', 'LANY', 194);
  Song song6 = Song('Good Girls', 'LANY', 223);
  Song song7 = Song('Thick and Thin', 'LANY', 196);


  Playlist mainStage = Playlist('Main Stage');
  Playlist indieStage = Playlist('Indie Stage');
  Playlist electronicStage = Playlist('Electronic Stage');


  mainStage.addSong(song1);
  mainStage.addSong(song4);
  mainStage.addSong(song5);
  mainStage.addSong(song6);
  mainStage.addSong(song7);

  indieStage.addSong(song2);

  electronicStage.addSong(song3);


  MusicFestival festival = MusicFestival('LANY Music Festival');
  festival.addStage(mainStage);
  festival.addStage(indieStage);
  festival.addStage(electronicStage);


  print('Total Festival Duration: ${festival.totalFestivalDuration()} seconds');
 

 
  print('Random Songs:');
  indieStage.songs[0].display();
  electronicStage.songs[0].display();
  mainStage.songs[0].display();
 


  mainStage.sortByArtist();
  print('Main Stage playlist sorted by artist:');
  mainStage.displayPlaylist();
}
