import { Component } from '@angular/core';
import { BibleVers } from '../../../shared/reusables/bible-vers/bible-vers';
import { BibleTitle } from '../../../shared/reusables/bible-title/bible-title';

const vers = 
    {
        book: "Johannes",
        chapter: 1,
        verses:[ 
          {
            verse: 1,
            text: "Im Anfang war das Wort und das war bei Gott, und das Wort war Gott."
          },        
          {
            verse: 2,
            text: "Dieses war im Anfang bei Gott."
          },        
          {
            verse: 3,
            text: "ist durch dasselbe entstanden; und ohne dasselbe ist auch nicht eines entstanden, was entstanden ist."
          }
        ],
    }

@Component({
  selector: 'ots-bibleverse',
  imports: [BibleVers, BibleTitle],
  templateUrl: './bible-comment.html',
  styleUrl: './bible-comment.css',
})
export class BibleComment {
  verses = vers;
  versTitle = this.readVerses();

  readVerses() {
    const ranges = [];
    let start = vers.verses[0].verse;
    let prev = vers.verses[0].verse;

    for (let i = 1; i < vers.verses.length; i++) {
      const n = vers.verses[i].verse;
      if (n === prev+1)
        prev = n;
      else {
        ranges.push(start === prev ? String(start) : `${start}-${prev}`);
        start = prev = n;
      }   
    }
    ranges.push(start === prev ? String(start) : `${start}-${prev}`);
    return ranges.join('.');
  }

}
