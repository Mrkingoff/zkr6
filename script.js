// Data item (dapat diganti dengan data dari API atau database)
const items = [
    {
        id: 1,
        title: "Zikir Pagi",
        description: "Kumpulan zikir dan doa untuk pagi hari sesuai sunnah Nabi Muhammad SAW.",
        downloadUrl: "#"
    },
    {
        id: 2,
        title: "Zikir Petang",
        description: "Kumpulan zikir dan doa untuk petang hari sesuai sunnah Nabi Muhammad SAW.",
        downloadUrl: "#"
    },
    {
        id: 3,
        title: "Doa Sehari-hari",
        description: "Kumpulan doa untuk aktivitas sehari-hari sesuai ajaran Islam.",
        downloadUrl: "#"
    },
    {
        id: 4,
        title: "Asmaul Husna",
        description: "99 nama Allah yang indah beserta arti dan keutamaannya.",
        downloadUrl: "#"
    },
    {
        id: 5,
        title: "Sholawat Nabi",
        description: "Kumpulan sholawat kepada Nabi Muhammad SAW dengan berbagai keutamaan.",
        downloadUrl: "#"
    },
    {
        id: 6,
        title: "Ayat Kursi",
        description: "Ayat Kursi beserta terjemahan, keutamaan, dan tafsir singkat.",
        downloadUrl: "#"
    }
];

// Fungsi untuk menampilkan item
function displayItems(itemsToDisplay) {
    const container = document.getElementById('itemsContainer');
    container.innerHTML = '';
    
    itemsToDisplay.forEach(item => {
        const itemElement = document.createElement('div');
        itemElement.className = 'item';
        itemElement.innerHTML = `
            <div class="item-image">${item.title}</div>
            <div class="item-content">
                <h3 class="item-title">${item.title}</h3>
                <p class="item-description">${item.description}</p>
                <button class="download-btn" data-id="${item.id}">Download</button>
            </div>
        `;
        container.appendChild(itemElement);
    });
    
    // Tambahkan event listener untuk tombol download
    document.querySelectorAll('.download-btn').forEach(button => {
        button.addEventListener('click', function() {
            const itemId = this.getAttribute('data-id');
            const item = items.find(i => i.id == itemId);
            alert(`Mengunduh: ${item.title}`);
            // Di sini Anda bisa menambahkan logika download sebenarnya
            // window.location.href = item.downloadUrl;
        });
    });
}

// Fungsi pencarian
function setupSearch() {
    const searchInput = document.querySelector('.search-container input');
    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const filteredItems = items.filter(item => 
            item.title.toLowerCase().includes(searchTerm) || 
            item.description.toLowerCase().includes(searchTerm)
        );
        displayItems(filteredItems);
    });
}

// Fungsi untuk menu dropdown
function setupMenu() {
    const menuBtn = document.querySelector('.menu-btn');
    const dropdownMenu = document.querySelector('.dropdown-menu');
    
    menuBtn.addEventListener('click', function() {
        dropdownMenu.classList.toggle('show');
    });
    
    // Tutup menu ketika klik di luar
    document.addEventListener('click', function(event) {
        if (!event.target.matches('.menu-btn')) {
            if (dropdownMenu.classList.contains('show')) {
                dropdownMenu.classList.remove('show');
            }
        }
    });
}

// Inisialisasi aplikasi
document.addEventListener('DOMContentLoaded', function() {
    displayItems(items);
    setupSearch();
    setupMenu();
});
