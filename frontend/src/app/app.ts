import { Component, inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { UserService } from './services/user-service';
import { JsonPipe } from '@angular/common';
import { Header } from './components/header';
import { Footer } from './components/footer';

@Component({
  selector: 'ots-root',
  imports: [RouterOutlet, JsonPipe, Header, Footer],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  userService = inject(UserService);
  res = "";
  constructor() {
    this.userService.allUsers().subscribe((res) => {
      this.res = JSON.stringify(res);
    });
  }
}
