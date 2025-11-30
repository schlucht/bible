import { Component } from '@angular/core';

import { RouterModules } from '../../../core/constant/ModuleImports';
import { Sidebar } from '../sidebar/sidebar';

@Component({
  selector: 'ots-bible',
  imports: [RouterModules, Sidebar],
  templateUrl: './bible.html',
  styleUrl: './bible.css',
})
export class Bible {

}
