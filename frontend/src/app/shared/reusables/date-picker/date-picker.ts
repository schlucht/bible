import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'ots-date-picker',
  imports: [DatePipe],
  templateUrl: './date-picker.html',
  styleUrl: './date-picker.css',
})
export class DatePicker {
  date = Date.now();
}
