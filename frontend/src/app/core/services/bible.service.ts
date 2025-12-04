import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { environment } from '../../../environments/environment.development';
import { Books, Testaments } from '../model/bible/interface/bible.interface';
import { catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class BibleService {
  httpClient = inject(HttpClient);
  root = environment.API.API_ROOT;
  path =  this.root + environment.API.API_BIBLE.ALL_BOOKS;
  pathTestaments = this.root + environment.API.API_BIBLE.ALL_TESTAMENT;

  allBooks() {    
    return this.httpClient.get<Books>(this.path).pipe(
        catchError(error => {
          console.error('An error occurred:', error);
          return throwError(() => error);
        })
    );
  }

  allTestaments() {    
    return this.httpClient.get<Testaments>(this.pathTestaments).pipe(
        catchError(error => {
          console.error('An error occurred:', error);
          return throwError(() => error);
        })
    );
  }

  


}