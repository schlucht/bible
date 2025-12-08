import { Component } from '@angular/core';
import { RouterModules } from '../../../core/constant/ModuleImports';
import { sideMenue } from '../../../core/constant/sideMenu';
import { Menus } from '../../../core/model/bible/interface/Menu.interface';

@Component({
  selector: 'ots-sidebar',
  imports: [RouterModules],
  templateUrl: './sidebar.html',
  styleUrl: './sidebar.css',
})
export class Sidebar {
  menus: Menus = sideMenue;
}
