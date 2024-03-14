// 이미지 미리보기를 표시하는 함수
    function displaySelectedImagesForUpdate(input) {
        const selectedFiles = input.files;
        const imagePreviewContainer = document.getElementById('imagePreview');

        // 이미지 미리보기 영역 초기화
        if (!imagePreviewContainer) {
            console.error('Image preview container not found!');
            return;
        }
        imagePreviewContainer.innerHTML = '';

        // 선택된 이미지 파일들의 미리보기를 표시
        for (let i = 0; i < selectedFiles.length; i++) {
            const file = selectedFiles[i];
            const reader = new FileReader();

            reader.onload = function(event) {
                const imgElement = document.createElement('img');
                imgElement.src = event.target.result;
                imgElement.style.maxWidth = '200px';
                imgElement.style.maxHeight = '200px';
                imgElement.style.height = 'auto';
                imgElement.style.marginBottom = '10px';
                imagePreviewContainer.appendChild(imgElement);
            };

            reader.readAsDataURL(file);
        }
    }