import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Header } from './components/header';
import { Footer } from './components/footer';

@Component({
  selector: 'ots-root',
  imports: [RouterOutlet, Header, Footer],
  template: `
    <div class="h-screen">
      <ots-header></ots-header>
      <main class="h-[70%]">
          <h1>Hello </h1>
          <router-outlet></router-outlet>
      </main>   
      <ots-footer></ots-footer>
    </div>
  `,  
})
export class App {
  
}
