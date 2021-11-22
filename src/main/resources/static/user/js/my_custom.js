function togglePlayer() {
    document.querySelector('#audioPlayer').classList.toggle('show');
    document.querySelector('.dropdown-song-menu').classList.remove('show');
    document.querySelector('.dropdown-volume-range').classList.remove('show');
}

let isPlaying = true;

function audioControl(e) {
    document.querySelector('#audioPlayer').classList.toggle('playing');
    isPlaying = !isPlaying;
}

function changeProgressSong(e) {
    document.querySelector('.progressbar .bar').style.width = e.value + "%";
}

function toggleMenuVolume(elementName) {
    document.querySelector(`.${elementName}`).classList.toggle('show');
}

function toggleMenuSong(elementName, elementLink) {
    document.querySelector(`.${elementName}`).classList.toggle('show');
    document.querySelectorAll(`.${elementLink}`).forEach(el => {
        el.addEventListener('click', () => {
            document.querySelector(`.${elementName}`).classList.remove('show');
        })
    })
}

function togglePlaylist() {
    document.querySelector('.playlist__box').classList.toggle('show');
}

function toggleLyrics(){
    document.querySelector('.lyric-box').classList.toggle('show');
}

function hideLyrics(){
    document.querySelector('.lyric-box').classList.remove('show');
}

function changeVolumeIcon(e) {
    let value = e.value;
    const iconVolume = document.querySelector('.btn-toggle-volume i');
    if (value == 0) {
        iconVolume.classList = "las la-volume-mute audio__icon";
    } else if (value < 50) {
        iconVolume.classList = "las la-volume-down audio__icon";
    } else {
        iconVolume.classList = "las la-volume-up audio__icon";
    }
}

const shareLink = document.querySelector('.share-link');
shareLink.addEventListener('click', (e) => {
    e.preventDefault();
    navigator.clipboard.writeText(shareLink.getAttribute("href"));
})
const favoriteLink = document.querySelector('.favorite-link');
favoriteLink.addEventListener('click', () => {
    if (favoriteLink.getAttribute('data-favorite') === "yes") {
        favoriteLink.innerHTML = `<i class="las la-heart"></i>
        <span>Favorite</span>`;
        favoriteLink.setAttribute('data-favorite', 'no');
    } else {
        favoriteLink.innerHTML = `<i class="lar la-heart"></i>
        <span>Favorite</span>`;
        favoriteLink.setAttribute('data-favorite', 'yes');
    }
})

const lyrics = [
    "Hey",
    "She said, 'I really miss the old you'",
    "Then found someone better (whoa)",
    "I really miss the old me (yeah, yeah)",
    "Maybe he was better, oh, oh, oh",
    "But I realize I'm doin' fine",
    "I just start thinkin' crazy when you're on my mind (crazy when you're on my mind, yeah)",
    "You'll be okay and I'll be alright",
    "But I've gotta say",
    "If we're said and done I know, I shouldn't say that",
    "I still care, but I still care",
    "And even when you're movin' on I hope you know that",
    "I'll be there, I'll be there",
    "I'll be there for you",
    "I'll be there for you",
    "Even if you don't want me to",
    "I'll be there for you",
    "Be there for you",
    "I'll be there for you",
    "Even if you don't want me to",
    "I'll be there for you",
    "(Yeah)",
    "I really gotta ask myself (oh)",
    "If I knew you weren't good for me then",
    "Why do I want you back right now? Oh",
    "Like you think I would've asked by now (oh)",
    "I'm in the palm of your hand, and then you don't give a damn",
    "Was it easy to let me go? (Say it)",
    "Say it quick, love my name when you sayin' it",
    "I don't even know why I'm sayin' this",
    "'Cause nothin' I'm sayin' is gonna change this",
    "But I realize I'm doin' fine",
    "I just start thinkin' crazy when you're on my mind",
    "You'll be okay and I'll be alright",
    "But I've gotta say",
    "If we're said and done I know, I shouldn't say that",
    "I still care, but I still care",
    "And even when you're movin' on I hope you know that (I hope you know)",
    "I'll be there, I'll be there",
    "Be there for you",
    "Ooh, ooh",
    "I'll be there for you",
    "Ooh, ooh",
    "Be there for you",
    "I'll be there for you",
    "Even if you don't want me to",
    "I'll be there for you"
]
function renderLyric (){
    let htmls = lyrics.map(line =>{
        return `<p>${line}</p>`;
    })

    console.log(htmls.join(''));
}

// renderLyric();