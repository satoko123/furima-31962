document.addEventListener('DOMContentLoaded', function() {
//プレビュー機能
if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list')
      
      // 選択した画像を表示する関数
      const createImageHTML = (blob) => {
        // 画像を表示するためのdiv要素を生成
        const imageElement = document.createElement('div')
        imageElement.setAttribute('class', "image-element")
        let imageElementNum = document.querySelectorAll('.image-element').length


        // 表示する画像を生成
        const blobImage = document.createElement('img')
        blobImage.setAttribute('src', blob)
        // blobImage.setAttribute('id', 'image-preview')

        //最初のlabel要素を消す
        const firstLabel = document.getElementById('first-label')
        firstLabel.setAttribute('style', 'display: none;')

        // ファイル選択ボタンを生成
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('id', `item-image-${imageElementNum}`)
        inputHTML.setAttribute('name', 'item[images][]')
        inputHTML.setAttribute('type', 'file')
        inputHTML.setAttribute('style', 'display: none;')

        //文字生成
        const createDiv = document.createElement('div')
        createDiv.setAttribute('class', 'click')
        const string = 'クリックして選択'
        createDiv.insertAdjacentHTML('afterbegin', string) //生成した文字列をdiv要素に入れる

        //label要素を作成
        const labelElement = document.createElement('label')
        labelElement.setAttribute('for', `item-image-${imageElementNum}`)
        labelElement.setAttribute('class', 'fa fa-file-image-o')
        labelElement.setAttribute('id', `item-${imageElementNum}`)
        
        // 生成したHTMLの要素をブラウザに表示させる
        imageElement.appendChild(blobImage) //生成したimg要素を生成したdiv要素に入れる
        ImageList.appendChild(imageElement) //生成したdiv要素をimage-listに入れる
        labelElement.appendChild(inputHTML) //生成したinput要素をlabel要素に入れる
        labelElement.appendChild(createDiv) //生成した文字列をlabel要素に入れる
        let clickUpload = document.getElementsByClassName('click-upload')
        clickUpload[0].appendChild(labelElement)//label要素をclick-uploadに入れる

        //2枚目からは一つ前のlabel要素を削除
        if (imageElementNum > 0){
          const labelBefore = document.getElementById(`item-${imageElementNum-1}`)
          labelBefore.setAttribute('style', 'display: none;')
        }

        // 画像5枚目でファイル選択ボタンを非表示にする
        if (imageElementNum === 4) {
          clickUpload = document.getElementsByClassName('click-upload')
          clickUpload[0].setAttribute('style', 'display: none;')
        }

        inputHTML.addEventListener('change', (e) => {
          file = e.target.files[0];
          blob = window.URL.createObjectURL(file);
          createImageHTML(blob)
        })
      }
      document.getElementById('item-image').addEventListener('change', (e) => {
        let file = e.target.files[0];
        let blob = window.URL.createObjectURL(file);
  
        createImageHTML(blob)
      });
  }
});