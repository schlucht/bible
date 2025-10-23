import { Component, computed, inject, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { API } from './app.config';
import { AppService } from './services/app.service';

@Component({
  selector: 'ots-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected title = signal('frontend');
  result = inject(AppService);
  werte:string = '';

  s =setTimeout(() => {
    this.title.set('backend');
    console.log(API);
  }, 2000);
  constructor() {
    this.result.sayHello().subscribe({
      next: (res) => {
        this.werte = JSON.stringify(res);
      },
      error: (err) => {
        console.log(err)
      }
    })
  }  
}
