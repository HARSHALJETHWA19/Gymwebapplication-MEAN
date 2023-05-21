import { Directive } from '@angular/core';

@Directive({
  selector: '[app]'
})
export class CustomDirective {
  constructor() { }
}

export default CustomDirective;
