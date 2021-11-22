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

function showTimer(){
    document.querySelector('.set-timer').classList.add('show')
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

// Dropdown select
// Get dropdowns and form
const dropdowns = document.querySelectorAll('[data-dropdown]');
const form = document.querySelector('form');

// Check if dropdowns exist on page
if (dropdowns.length > 0) {
  // Loop through dropdowns and create custom dropdown for each select element
  dropdowns.forEach(dropdown => {
    createCustomDropdown(dropdown);
  });
}

// Check if form element exist on page
if (form !== null) {
  // When form is submitted console log the value of the select field
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    console.log('Selected country:', form.querySelector('[name="genres"]').value);
  });
}

// Create custom dropdown
function createCustomDropdown(dropdown) {
  // Get all options and convert them from nodelist to array
  const options = dropdown.querySelectorAll('option');
  const optionsArr = Array.prototype.slice.call(options);

  // Create custom dropdown element and add class dropdown to it
  // Insert it in the DOM after the select field
  const customDropdown = document.createElement('div');
  customDropdown.classList.add('form__select-dropdown');
  dropdown.insertAdjacentElement('afterend', customDropdown);

  // Create element for selected option
  // Add class to this element, text from the first option in select field and append it to custom dropdown
  const selected = document.createElement('div');
  selected.classList.add('dropdown__selected');
  selected.textContent = optionsArr[0].textContent;
  customDropdown.appendChild(selected);

  // Create element for dropdown menu, add class to it and append it to custom dropdown
  // Add click event to selected element to toggle dropdown menu
  const menu = document.createElement('div');
  menu.classList.add('dropdown__menu');
  customDropdown.appendChild(menu);
  selected.addEventListener('click', toggleDropdown.bind(menu));

  // Create serach input element
  // Add class, type and placeholder to this element and append it to menu element
  const search = document.createElement('input');
  search.placeholder = 'Search...';
  search.type = 'text';
  search.classList.add('dropdown__menu_search');
  menu.appendChild(search);

  // Create wrapper element for menu items, add class to it and append to menu element
  const menuItemsWrapper = document.createElement('div');
  menuItemsWrapper.classList.add('dropdown__menu_items');
  menu.appendChild(menuItemsWrapper);

  // Loop through all options and create custom option for each option and append it to items wrapper element
  // Add click event for each custom option to set clicked option as selected option
  optionsArr.forEach(option => {
    const item = document.createElement('div');
    item.classList.add('dropdown__menu_item');
    if (option.value == '') {
      item.style.pointerEvents = 'none'
    }
    item.dataset.value = option.value;
    item.textContent = option.textContent;
    menuItemsWrapper.appendChild(item);

    item.addEventListener('click', setSelected.bind(item, selected, dropdown, menu));
  });

  // Add selected class to first custom option
  menuItemsWrapper.querySelector('div').classList.add('selected');

  // Add input event to search input element to filter items
  // Add click event to document element to close custom dropdown if clicked outside of it
  // Hide original dropdown(select)
  search.addEventListener('input', filterItems.bind(search, optionsArr, menu));
  document.addEventListener('click', closeIfClickedOutside.bind(customDropdown, menu));
  dropdown.style.display = 'none';
}

// Toggle dropdown
function toggleDropdown() {
  // Check if dropdown is opened and if it is close it, otherwise open it and focus search input
  if (this.offsetParent !== null) {
    this.style.display = 'none';
  } else {
    this.style.display = 'block';
    this.querySelector('input').focus();
  }
}

// Set selected option
function setSelected(selected, dropdown, menu) {
  // Get value and label from clicked custom option
  const value = this.dataset.value;
  const label = this.textContent;

  // Change the text on selected element
  // Change the value on select field
  selected.textContent = label;
  dropdown.value = value;

  // Close the menu
  // Reset search input value
  // Remove selected class from previously selected option and show all divs if they were filtered
  // Add selected class to clicked option
  menu.style.display = 'none';
  menu.querySelector('input').value = '';
  menu.querySelectorAll('div').forEach(div => {
    if (div.classList.contains('selected')) {
      div.classList.remove('selected');
    }
    if (div.offsetParent === null) {
      div.style.display = 'block';
    }
  });
  this.classList.add('selected');
}

// Filter items
function filterItems(itemsArr, menu) {
  // Get all custom options
  // Get the value of search input and convert it to all lowercase characters
  // Get filtered items
  // Get the indexes of filtered items
  const customOptions = menu.querySelectorAll('.dropdown__menu_items div');
  const value = this.value.toLowerCase();
  const filteredItems = itemsArr.filter(item => item.innerText.toLowerCase().includes(value));
  const indexesArr = filteredItems.map(item => itemsArr.indexOf(item));

  // Check if option is not inside indexes array and hide it and if it is inside indexes array and it is hidden show it
  itemsArr.forEach(option => {
    if (!indexesArr.includes(itemsArr.indexOf(option))) {
      customOptions[itemsArr.indexOf(option)].style.display = 'none';
    } else {
      if (customOptions[itemsArr.indexOf(option)].offsetParent === null) {
        customOptions[itemsArr.indexOf(option)].style.display = 'block';
      }
    }
  });
}

// Close dropdown if clicked outside dropdown element
function closeIfClickedOutside(menu, e) {
  if (e.target.closest('.form__select-dropdown') === null && e.target !== this && menu.offsetParent !== null) {
    menu.style.display = 'none';
  }
}

// Form 
// Preview upload file
let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
function previewUpload(e) {
  console.log(e)
  const img = document.querySelector('.form__thumbnail-track img') || null
  const previewText = document.querySelector('.form__thumbnail-track p') || null
  const file = e.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function () {
      const result = reader.result;
      if(img && previewText){
        previewText.style.display = "none"
        img.style.display = "block"
        img.src = result
      }
      // wrapper.classList.add("active");
    }
    // cancelBtn.addEventListener("click", function () {
    //   img.src = "";
    //   wrapper.classList.remove("active");
    // });
    reader.readAsDataURL(file);
  }
  // if (this.value) {
  //   let valueStore = this.value.match(regExp);
  //   fileName.textContent = valueStore;
  // }
}

function uploadTrack(e){
  const file = e.files[0];
  const elDuration = document.querySelector('.file-duration-upload')
  const elSize = document.querySelector('.file-size-upload')
  const elName = document.querySelector('.file-name-upload')
  load(file)
      computeLength(file)
        .then((result) => {
            let secondDuration = Number.parseInt(result.duration);
            if(elDuration && elSize && elName){
              if (secondDuration < 3600) {
                  elDuration.value = new Date(secondDuration * 1000).toISOString().substr(14, 5);
              } else {
                  elDuration.value = new Date(secondDuration * 1000).toISOString().substr(11, 8);
              }
              elName.value = result.file.name
              elSize.value = sizeToMB(result.file.size)
            }
        })
}

function computeLength(file) {
    return new Promise((resolve) => {
        var objectURL = URL.createObjectURL(file);
        var mySound = new Audio([objectURL]);
        mySound.addEventListener(
            "canplaythrough",
            () => {
                URL.revokeObjectURL(objectURL);
                resolve({
                    file,
                    duration: mySound.duration
                });
            },
            false,
        );
    });
}

function sizeToMB(size){
  const mb = Math.round(size / (1024 * 1024) * 100) / 100
  return `${mb}MB`
}

function load(file){
  // 1. Khởi tạo XHR để call API
  const xhr = new XMLHttpRequest();

	// 2. Thêm dữ liệu
  const data = new FormData();
  data.append("file", file);
    
  // 4. Giả lập phương thức đăng tệp
  xhr.open("POST", "/upload", true);
  
  const progressBar = document.querySelector('.audio-upload-range')
  // 5. Lắng nghe sự kiện progress lấy tỉ lệ %
  xhr.upload.addEventListener("progress", function(event) {
    const percent = Math.round((event.loaded / event.total) * 100);
    if(progressBar){
      progressBar.style.width = percent + '%'
    }
  });
  
	// 6. Gửi yêu cầu
  xhr.send(data);
}

function setMinForAllDateInput(dateInputs){  
  if(dateInputs){
    const today = new Date().toISOString().split('T')[0]
    dateInputs.forEach(dateInput => {
      dateInput.setAttribute('min', today)
    })
  }
}

const dateInputs = document.querySelectorAll('input[type="date"]')
if(dateInputs){
  setMinForAllDateInput(dateInputs)
}


function createSearchFunc(e, parentName, childName, tagName){
  const keyword = e.value.trim().toLowerCase()
  const parentEl = document.querySelector(`.${parentName}`)
  const childEls = document.querySelectorAll(`.${parentName} .${childName}`)

  childEls.forEach(childEl =>{
    const name = childEl.querySelector(`${tagName}`)
    if(!name.textContent.toLowerCase().includes(keyword)){
      childEl.style.display = "none"
    }else{
      childEl.style.display = "flex"
    }
  })
}

