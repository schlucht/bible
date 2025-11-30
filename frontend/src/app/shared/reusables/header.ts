import { Component, inject, signal } from '@angular/core';
import { RouterModules } from '../../core/constant/ModuleImports';


@Component({
  selector: 'ots-header',
  imports: [RouterModules],
  templateUrl: './header.html'
})
export class Header {
}