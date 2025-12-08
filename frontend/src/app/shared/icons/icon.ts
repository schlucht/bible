import { Component, inject, input, OnChanges, SimpleChanges, ViewContainerRef, Type } from '@angular/core';
import { IcoMap, IconName } from '../../core/constant/IconConstant';

@Component({
  selector: 'ots-icon',
  imports: [],
  template: '',  
})
export class Icon implements OnChanges {
  name = input<IconName>('home');
  size = input<number>(24);
  fill = input<string>('var(--clr-primary-1)');
  
  private vcr = inject(ViewContainerRef);
  private icoMap = IcoMap;

  ngOnChanges(changes: SimpleChanges): void {
    console.log('change', changes);
    this.renderIcon();
  }

  private renderIcon() {
    this.vcr.clear();
    const cmp = this.icoMap[this.name()];
    if (cmp) {
      const ref = this.vcr.createComponent(cmp);
      ref.setInput('size', this.size());
      ref.setInput('fill', this.fill());
    }
  }
}
