import { Component, inject, signal } from '@angular/core';
import { IconModule, RouterModules } from '../../core/constant/ModuleImports';
import { RouterLinkActive } from '@angular/router';
import { Menus } from '../../core/model/bible/interface/Menu.interface';
import { headerMenue } from '../../core/constant/headerMenu';

@Component({
  selector: 'ots-header',
  imports: [RouterModules, RouterLinkActive, IconModule],
  templateUrl: './header.html',
  styleUrl: "header.css" 
})
export class Header {
  menus: Menus = headerMenue;
}