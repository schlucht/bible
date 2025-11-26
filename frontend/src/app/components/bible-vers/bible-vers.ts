import { Component, input } from '@angular/core';

@Component({
  selector: 'ots-bible-vers',
  imports: [],
  templateUrl: './bible-vers.html',
  styleUrl: './bible-vers.css',
})
export class BibleVers {
  Versnumber = input(0);
}
