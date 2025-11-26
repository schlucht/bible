import { Component, input } from '@angular/core';

@Component({
  selector: 'ots-bible-title',
  imports: [],
  templateUrl: './bible-title.html',
  styleUrl: './bible-title.css',
})
export class BibleTitle {
  title = input('');
  chapter = input(0);
  verse = input('');
}
