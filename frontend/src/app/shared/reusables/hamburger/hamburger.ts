import { NgClass } from '@angular/common';
import { Component, signal } from '@angular/core';

@Component({
  selector: 'ots-hamburger',
  imports: [NgClass],
  templateUrl: './hamburger.html',
  styleUrl: './hamburger.css',
})
export class Hamburger {
  open = signal(false);

  toggle() {
    this.open.set(!this.open());
  }
}
