import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets =  ["coopbranchSelect"] 
  
  change(event) {
      let cooperative_id = event.target.selectedOptions[0].value
      let target = this.coopbranchSelectTarget.id

      get(`/cooperatives/${cooperative_id}/selected?target=${target}`, {
        responseKind: "turbo-stream" 
      })
  }
}
