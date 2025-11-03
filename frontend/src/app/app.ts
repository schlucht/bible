import { Component, inject, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { UserService } from './services/user-service';
import { JsonPipe } from '@angular/common';

@Component({
  selector: 'ots-root',
  imports: [RouterOutlet, JsonPipe],
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
