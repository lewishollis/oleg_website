import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image", "title", "description", "medium", "year"]

  open(event) {
    const { title, description, medium, year, image } = event.params

    console.log('Modal opening with params:', { title, description, medium, year, image })

    this.titleTarget.textContent = title

    // Format description with paragraph breaks
    const desc = description || "No description available."

    // Split by double line breaks (handle both \n\n and \r\n\r\n)
    const paragraphs = desc
      .split(/\n\s*\n/)
      .map(p => p.trim())
      .filter(p => p.length > 0)
      .map(p => `<p class="mb-4 last:mb-0">${this.escapeHtml(p)}</p>`)
      .join("")

    this.descriptionTarget.innerHTML = paragraphs

    this.mediumTarget.textContent = medium || ""
    this.yearTarget.textContent = year || ""
    this.imageTarget.src = image
    this.imageTarget.alt = title

    this.modalTarget.classList.remove("hidden")
    document.body.style.overflow = "hidden"
  }

  escapeHtml(text) {
    const div = document.createElement('div')
    div.textContent = text
    return div.innerHTML
  }

  close() {
    this.modalTarget.classList.add("hidden")
    document.body.style.overflow = ""
  }

  closeBackground(event) {
    if (event.target === event.currentTarget) {
      this.close()
    }
  }

  stopPropagation(event) {
    event.stopPropagation()
  }

  connect() {
    // Close modal on Escape key
    this.escapeHandler = (event) => {
      if (event.key === "Escape") {
        this.close()
      }
    }
    document.addEventListener("keydown", this.escapeHandler)
  }

  disconnect() {
    document.removeEventListener("keydown", this.escapeHandler)
  }
}
