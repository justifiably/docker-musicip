# Headless MusicIP server in a Docker container

MusicIP runs very nicely serving up mixes of your local music,
especially in conjunction with Logitech Media Server.

Although it's a very old program by now (and unfortunately closed
source), I find it still makes mixes with a nice flavour, even better
than Echonest in some respects (when that was easily available before
Spotify made things difficult).

## Usage

Launch the container with a command like this:

    docker run -d -p 10002:10002 -v <host-music-dir>:/music justifiably/musicip

where <host-music-dir> is a directory containing music files.

Visit the web server at <http://localhost:10002> and add some
music files to analyse, from `/music` or other directories containing 
your music files mounted as volumes so they are visible to the server.
See the example `docker-compose.yml`.

If you want to keep the database and settings outside the container, you can
map a volume to `/home/musicip`.  This should have a subdirectory 
create the directory `.MusicMagic` and put a `mmm.ini` file into it,
start with the example included here and read the documentation at
[Spicefly](https://www.spicefly.com/article.php?page=musicip-linux).

Make sure the file and directory are owned by UID 1057 (or change the
`PUID` arg and rebuild).

See extensive information and binaries kindly maintained at
[Spicefly.com](http://www.spicefly.com), including 
[documentation of the API](http://www.spicefly.com/article.php?page=musicip-http).


## Tricks: changing file locations, types...

To interface with Logitech Media Server I use an nginx wrapper which
remaps some filenames and extensions, mainly for the historical reason
that I ripped most of my CDs and bought iTunes music in m4a format
before switching to Flac.  Unfortunately the Linux version of MusicIP
cannot read m4a files so I generated a shadow tree of lower bitrate
mp3 files (also handy for devices).

See `musicip.nginx` for how to do this with nginx, which seems to
work, more or less.  I find it a cleaner solution than the one which
is built into the Spicefly plugin, but YMMV.


