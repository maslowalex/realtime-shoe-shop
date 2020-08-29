
const dom = {}

dom.resetItemCounts = () => {
  Array.from(document.getElementsByClassName('admin-item-cart-count')).forEach((el) => el.innerText = '0')
}

dom.setItemCount = (itemId, count) => {
  document.getElementById(`admin-item-cart-count-${itemId}`).innerText = count
}

dom.setShopperCount = (count) => {
  document.getElementById('shopper-count').innerText = count
}

dom.assemblePageCounts = (pageCounts) => {
  const target = document.querySelector('#shoppers-by-page > .target')
  const fragment = document.createRange().createContextualFragment(`
    <div class="target">
      <div class="admin-item-list">
      ${
        Object.keys(pageCounts).sort().map((pagePath) => `
          <div class="admin-item-entry">
            <span class="admin-item-entry__number">${pageCounts[pagePath]}</span>
            <span class="admin-item-entry__path">${pagePath}</span>
          </div>
        `)
      }
      </div>
    </div>
  `)

  target.replaceWith(fragment)
}

export default dom
