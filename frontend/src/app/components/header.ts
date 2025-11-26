import { Component, inject, signal } from '@angular/core';
import { RouterLink, RouterOutlet } from '@angular/router';

import { JsonPipe } from '@angular/common';

@Component({
  selector: 'ots-header',
  imports: [RouterOutlet, JsonPipe, RouterLink],
  templateUrl: './header.html'
})
export class Header {
}