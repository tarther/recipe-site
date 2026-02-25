import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input","store","suggestions"]

  get selectedStore() {
    const checked = this.storeTargets.find(radio => radio.checked)
    return checked ? checked.value : null
  }

  connect() {
    this.selecting = false

    this.inputTargets.forEach((input, index) => {
      input.addEventListener("input", () => {

        if (this.selecting) {
          this.selecting = false
          return
        }

        this.search(input, this.suggestionsTargets[index])
      })
    })
  }

  search(input, suggestions) {
    const query = input.value
    const store = this.selectedStore

    if (query.length < 2) {
      suggestions.innerHTML = ""
      return
    }

    fetch(`/products/search_products?q=${query}&store=${store}`)
      .then(res => res.json())
      .then(data => {
        suggestions.innerHTML = ""

        data.forEach(product => {
          const item = document.createElement("a")
          item.href = "#"
          item.textContent = product.name
          item.classList.add("list-group-item", "list-group-item-action")

          item.addEventListener("click", (e) => {
            e.preventDefault()
            this.selecting = true 
            input.value = product.name
            const hiddenField = input.parentElement.querySelector('input[type="hidden"]')
            hiddenField.value = product.code
            suggestions.innerHTML = ""
          })

          suggestions.appendChild(item)
        })
      })
  }
}
