import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "image", "title", "description", "medium", "year"]

  open(event) {
    const { artworkModalTitleParam, artworkModalDescriptionParam, artworkModalMediumParam, artworkModalYearParam, artworkModalImageParam } = event.params

    this.titleTarget.textContent = artworkModalTitleParam
    this.descriptionTarget.textContent = artworkModalDescriptionParam || "No description available."
    this.mediumTarget.textContent = artworkModalMediumParam || ""
    this.yearTarget.textContent = artworkModalYearParam || ""
    this.imageTarget.src = artworkModalImageParam
    this.imageTarget.alt = artworkModalTitleParam

    this.modalTarget.classList.remove("hidden")
    document.body.style.overflow = "hidden"
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
