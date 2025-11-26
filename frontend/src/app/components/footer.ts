import { Component, inject, signal } from '@angular/core';
import { RouterLink, RouterOutlet } from '@angular/router';
import { DatePipe, JsonPipe } from '@angular/common';

@Component({
  selector: 'ots-footer',
  imports: [DatePipe],
  template: `<div>
                <p>
                    Copyright © 2025 - {{ date | date: 'yyyy' }} JaGoLo. All rights reserved.
                </p>
            </div>`,
    styles: `
        div {
            text-align: center;
            padding: 1rem;
            p {
                color: var(--clr-scondary-1);
            }
        }
    `
})
export class Footer {
    date = Date.now();
}