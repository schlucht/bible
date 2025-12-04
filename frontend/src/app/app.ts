import { Component, inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { UserService } from './core/services/user-service';
import { JsonPipe } from '@angular/common';
import { Header } from './shared/reusables/header';
import { Footer } from './shared/reusables/footer';

@Component({
  selector: 'ots-root',
  imports: [RouterOutlet, Header, Footer],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
   
  constructor() {
   
  }
}
