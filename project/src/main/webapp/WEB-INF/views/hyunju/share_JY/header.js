// 로그아웃 기능 (시작)
const searchButton = document.getElementById('searchButton');
const searchInput = document.getElementById('searchInput');

searchButton.addEventListener('click', () => {
    const searchQuery = searchInput.value;
    // searchQuery를 사용하여 검색 로직 수행
    console.log('Search Query:', searchQuery);
});
// 로그아웃 기능 (끝)