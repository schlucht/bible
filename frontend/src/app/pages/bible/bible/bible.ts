import { Component, inject, OnInit, signal } from '@angular/core';

import { RouterModules } from '../../../core/constant/ModuleImports';
import { Sidebar } from '../sidebar/sidebar';
import { Hamburger } from '../../../shared/reusables/hamburger/hamburger';
import { NgClass } from '@angular/common';

@Component({
  selector: 'ots-bible',
  imports: [RouterModules, Sidebar, Hamburger, NgClass],
  templateUrl: './bible.html',
  styleUrl: './bible.css',
})
export class Bible  {
  open = signal(false);
  openSidebar() {
    this.open.set(!this.open());
  }
}
