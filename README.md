# nvm_docker

Small helpfull repo for testing NVM settings.

## Example

### Base usage

* `mdkir videos`
* Put Mp4 sample to `videos` forlder with name `file.mp4`  
* from repo root run: `make build_latest && make run`
* play some examples: `ffplay http://localhost:3030/hls/file_1v_1a.json/master.m3u8`

More exaples: https://github.com/Bragaman/nvm_docker/tree/master/examples/json

### Encripted MP4

* Put Mp4 sample to `videos` forlder with name `file.mp4`  
* from repo root run: `make ffmpeg_encript`
* from repo root run: `make build_latest && make run`
* play: `ffplay http://localhost:3030/dash/encripted_file_1v_1a.json/manifest.mpd`
