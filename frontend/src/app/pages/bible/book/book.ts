import { Component, computed, inject, signal } from '@angular/core';
import { BibleService } from '../../../core/services/bible.service';
import { catchError, of } from 'rxjs';
import { toSignal } from '@angular/core/rxjs-interop';
import { FormsModule } from '@angular/forms';
import { NgClass } from '@angular/common';

@Component({
  selector: 'ots-book',
  imports: [FormsModule, NgClass],
  templateUrl: './book.html',
  styleUrl: './book.css',
})
export class Book {
  
    http = inject(BibleService);
    errorMsg = signal('');
    selecetedTestament = signal<number | undefined>(undefined);
    displayTestamentForm = signal(false);



    books = toSignal(this.http.allBooks().pipe(
      catchError(err => {
        this.errorMsg.set('Fehler beim Laden der Bücher ' + err);
        return of([]);
      })
    ), {initialValue: []});   
     
    booksNT = computed(() => {
      const id = this.selecetedTestament();      
      if (!id) {
        return this.books();
      }
      return this.books().filter((book) => book.testament.id === +id)    
    });
    

    testaments = toSignal(this.http.allTestaments().pipe(      
      catchError(err => {
        this.errorMsg.set('Fehler beim Laden der Testaments ' + err);
        return of([]);
      })
    ), {initialValue: []});

    displayNewTestamentForm() {
      this.displayTestamentForm.set(!this.displayTestamentForm());
    }
    
}
