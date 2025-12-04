import { Component, inject, signal } from '@angular/core';
import { RouterModules } from '../../core/constant/ModuleImports';
import { RouterLinkActive } from '@angular/router';


@Component({
  selector: 'ots-header',
  imports: [RouterModules, RouterLinkActive],
  templateUrl: './header.html',
  styleUrl: "header.css" 
})
export class Header {
}